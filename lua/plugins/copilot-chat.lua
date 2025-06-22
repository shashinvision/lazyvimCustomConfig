-- This file contains the configuration for integrating GitHub Copilot and Copilot Chat plugins in Neovim.

-- Define prompts for Copilot
-- This table contains various prompts that can be used to interact with Copilot.
local prompts = {
  Explain = "Please explain how the following code works.", -- Prompt to explain code
  Review = "Please review the following code and provide suggestions for improvement.", -- Prompt to review code
  Tests = "Please explain how the selected code works, then generate unit tests for it.", -- Prompt to generate unit tests
  Refactor = "Please refactor the following code to improve its clarity and readability.", -- Prompt to refactor code
  FixCode = "Please fix the following code to make it work as intended.", -- Prompt to fix code
  FixError = "Please explain the error in the following text and provide a solution.", -- Prompt to fix errors
  BetterNamings = "Please provide better names for the following variables and functions.", -- Prompt to suggest better names
  Documentation = "Please provide documentation for the following code.", -- Prompt to generate documentation
  JsDocs = "Please provide JsDocs for the following code.", -- Prompt to generate JsDocs
  DocumentationForGithub = "Please provide documentation for the following code ready for GitHub using markdown.", -- Prompt to generate GitHub documentation
  CreateAPost = "Please provide documentation for the following code to post it in social media, like Linkedin, it has be deep, well explained and easy to understand. Also do it in a fun and engaging way.", -- Prompt to create a social media post
  SwaggerApiDocs = "Please provide documentation for the following API using Swagger.", -- Prompt to generate Swagger API docs
  SwaggerJsDocs = "Please write JSDoc for the following API using Swagger.", -- Prompt to generate Swagger JsDocs
  Summarize = "Please summarize the following text.", -- Prompt to summarize text
  Spelling = "Please correct any grammar and spelling errors in the following text.", -- Prompt to correct spelling and grammar
  Wording = "Please improve the grammar and wording of the following text.", -- Prompt to improve wording
  Concise = "Please rewrite the following text to make it more concise.", -- Prompt to make text concise
}

-- Plugin configuration
-- This table contains the configuration for various plugins used in Neovim.
return {

  -- Copilot Chat plugin configuration
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "main",
  cmd = "CopilotChat",
  opts = {
    prompts = prompts,
    system_prompt = [[
        Este GPT es un clon del usuario, un desarrollador full stack con amplia experiencia en arquitectura limpia, hexagonal y separación de lógica en aplicaciones escalables. Tiene un enfoque técnico, práctico y directo, siempre con explicaciones claras y aplicables, acompañadas de ejemplos útiles para desarrolladores de nivel intermedio y avanzado.

        Su tono es profesional pero cercano, relajado, con un toque de humor inteligente. Evita formalismos excesivos, usa un lenguaje directo y técnico cuando hace falta, pero accesible y sin vueltas. Su estilo auténtico, sin clichés, e incorpora expresiones como “buenas acá estamos” o “dale que va” según el contexto.

        Sus principales áreas de conocimiento incluyen:  
        - Desarrollo frontend con frameworks como Angular, React y Vue, y gestión avanzada de estados (RxJS, Signals y más).  
        - Backend y APIs RESTful y GraphQL usando Node.js, Express, .NET, y Python (FastAPI/Django).  
        - Bases de datos relacionales y NoSQL: PostgreSQL, MySQL, MongoDB, Redis.  
        - Arquitectura de software: Clean Architecture, Hexagonal Architecture y Screaming Architecture, aplicada tanto en frontend como backend.  
        - Integración continua, despliegue continuo (CI/CD), y manejo de contenedores con Docker y Kubernetes.  
        - Buenas prácticas en TypeScript, testing unitario y end-to-end para frontend y backend.  
        - Apasionado por modularización, atomic design y el patrón contenedor-presentacional.  
        - Uso eficiente de herramientas de productividad como LazyVim y Tmux  
        - Mentoría y enseñanza clara de conceptos técnicos avanzados.  
        - Liderazgo de comunidades y creación de contenido en YouTube.

        Al explicar un concepto técnico:  
        1. Describe el problema que enfrenta el usuario de forma simple.  
        2. Propone una solución clara y concreta, con ejemplos cuando corresponda.  
        3. Sugiere herramientas o recursos útiles para profundizar o implementar la solución.

        Si el tema es complejo, usa analogías prácticas relacionadas con construcción o arquitectura para facilitar la comprensión. Cuando menciona herramientas o conceptos, explica su utilidad y cómo aplicarlos sin redundancias ni tecnicismos innecesarios.

        Además, tiene experiencia en charlas técnicas y generación de contenido. Puede hablar sobre la importancia de la introspección, balancear liderazgo y comunidad, y cómo mantenerse actualizado mientras experimenta con nuevas tecnologías. Su comunicación es directa, pragmática y amena, sin rodeos.

        Ejemplo del estilo de comunicación:  
        "Le estaba contando la otra vez que tenía una condición que es de adulto altamente calificado, no sé si la conocen, pero no es buena… Lo estaba hablando con mi mujer y cuando yo era chico mi mamá me dijo que me habían encontrado una condición de IQ muy elevado, nivel 5 o 6 años por delante de un niño común."
      ]],
    -- model = "gemini-2.5-pro",
    answer_header = "⚔️ ShashinV — Code Warrior ⚔️",
    auto_insert_mode = true,
    window = {
      layout = "horizontal",
    },
    mappings = {
      complete = {
        insert = "<Tab>",
      },
      close = {
        normal = "q",
        insert = "<C-c>",
      },
      reset = {
        normal = "<C-l>",
        insert = "<C-l>",
      },
      submit_prompt = {
        normal = "<CR>",
        insert = "<C-s>",
      },
      toggle_sticky = {
        normal = "grr",
      },
      clear_stickies = {
        normal = "grx",
      },
      accept_diff = {
        normal = "<C-y>",
        insert = "<C-y>",
      },
      jump_to_diff = {
        normal = "gj",
      },
      quickfix_answers = {
        normal = "gqa",
      },
      quickfix_diffs = {
        normal = "gqd",
      },
      yank_diff = {
        normal = "gy",
        register = '"', -- Default register to use for yanking
      },
      show_diff = {
        normal = "gd",
        full_diff = false, -- Show full diff instead of unified diff when showing diff window
      },
      show_info = {
        normal = "gi",
      },
      show_context = {
        normal = "gc",
      },
      show_help = {
        normal = "gh",
      },
    },
  },
  config = function(_, opts)
    local chat = require("CopilotChat")

    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "copilot-chat",
      callback = function()
        vim.opt_local.relativenumber = true
        vim.opt_local.number = false
      end,
    })

    chat.setup(opts)
  end,
}
