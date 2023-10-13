local jdtls_home = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local jdtls = require("jdtls")

local config_dir = jdtls_home .. "/config_linux"
local plugins_dir = jdtls_home .. "/plugins"
local path_to_jar = jdtls_home .. "/plugins/org.eclipse.equinox.launcher_1.6.500.v20230717-2134.jar"

local root_markers = { "gradlew", "pom.xml", ".git", "mvnw", "build.gradle" }
local root_dir = jdtls.find_root(root_markers)
if root_dir then
  return
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir =  vim.fn.stdpath("data") .. "/site/java/workspace_root" .. project_name
os.execute("mkdir -p " .. workspace_dir)

local nnoremap = function(rhs, lhs, bufopts, desc)
  bufopts.desc = desc
  vim.key_map.set("n", rhs, lhs, bufopts)

end

local on_attach = function(client, bufnr)
  print("mapping java keys")
  local bufopts = { noremap = true, silent = true , buffer = bufnr}

  local spring_boot_run = './gradlew bootRun -Dspring-boot.run.profiles=$PROFILE'
  local command = ':lua require("toggleterm").exec("' .. spring_boot_run .. '")<CR>'
  nnoremap("<S-F9>", command)

  nnoremap("<leader>co", jdtls.organize_imports, bufopts, "Organize imports")
  nnoremap("n", "<leader>jc", ":lua require('jdtls').compile('incremental')")
  nnoremap("gI", vim.lsp.buf.implementation, bufopts, "Go to implementation")
  nnoremap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end)
  nnoremap('<C-A-l>', function() vim.lsp.buf.format { async = true } end, bufopts, "Format file")

end




local config = {

  flags = {
    debounce_text_changes = 120,
  },
  on_attach = on_attach,

  cmd = {
    "java",
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    '-jar', path_to_jar,
    '-configuration', config_dir
    '-data', workspace_dir,
  },

  root_dir = root_dir,
  settings = {
    java = {
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" },
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*"
        },
        importOrder = {
          "java",
          "javax",
          "org",
          "com",
          "junit",
          "net",
          "org.springframework",
          "static"
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999
        }
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
        }
      },
      configuration = {
        updateBuildConfiguration = "interactive",
        runtimes = {
          {
            name = "JavaSE-17",
            path = "~/.sdkman/candidates/java/17.0.7-amzn/",
          },
          {
            name = "JavaSE-8",
            path = "~/.sdkman/candidates/java/8.0.382-amzn/",
          }
        }
      },
      maven = {
        downloadSources = true,
        downloadJavadocs = true,
      },
      gradle = {
        downloadSources = true,
        downloadJavadocs = true,
      },
      format = {
        enabled = true,
        settings = {
          url = vim.fn.stdpath("config") .. "/lang-servers/intellij-java-google-style.xml",
          profile = "GoogleStyle",
        },

      },
    }
  }
}



jdtls.start_or_attach(config)

