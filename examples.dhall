let conf = ./spago.dhall

in      conf
    //  { sources = conf.sources # [ "examples/**/*.purs" ]
        , dependencies =
              conf.dependencies
            # [ "web-html"
              , "canvas"
              , "exceptions"
              , "node-process"
              , "filterable"
              , "node-fs"
              , "datetime"
              , "affjax-web"
              , "node-buffer"
              , "argonaut"
              , "codec-argonaut"
              , "console"
              , "tuples"
              , "affjax"
              , "either"
              , "monoid-extras"
              , "integers"
              , "random"
              , "aff"
              , "argonaut-core"
              , "web-uievents"
              , "http-methods"
              , "maybe"
              , "typelevel-prelude"
              ]
        }
