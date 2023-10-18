local jdtls_home = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local jdtls = require('jdtls')

local config_dir = jdtls_home .. "/config_linux"
local plugins_dir = jdtls_home .. "/plugins/org.eclipse.equinox.launcher_1.6.500.v20230717-2134.jar"

local root_markers = {'gradlew', 'mvnw', '.git', 'pom.xml', 'build.gradle'}
local root_dirs = require('jdtls.setup').find_root(root_markers)
local workspace_folder = jdtls_home .. "/.local/share/"

if root_dirs then
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
  local bufopts = {noremap=true, silent=true, buffer=bufnr}
  local spring_boot_run = './gradlew bootRun -Dspring-boot.run.profiles=$PROFILE'
  local command = ':lua require("toggleterm").exec("' .. spring_boot_run ..'")<cr>'
  nnoremap("<space>gG", command)

  nnoremap('gD', vim.lsp.buf.declaration.bufopts, "Got to declaration")

  -- Java extension jdtls
  nnoremap("<C-o>", jdtls.organize_imports, bufopts, "Organize Imports")
  nnoremap("<leader>ev", jdtls.extract_variable, bufopts, "Extract Variable")
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



