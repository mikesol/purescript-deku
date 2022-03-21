let conf = ./spago.dhall

in      conf
    //  { sources = conf.sources # [ "examples/**/*.purs" ]
        , dependencies =
              conf.dependencies
            # [  "arrays"
              , "transformers"
              , "web-html"
              , "affjax"
              , "aff"
              , "argonaut-core"
              , "http-methods"
              ]
        }
