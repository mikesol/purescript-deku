let conf = ./spago.dhall

in      conf
    //  { sources = conf.sources # [ "examples/**/*.purs" ]
        , dependencies =
              conf.dependencies
            # [ "web-html"
              , "canvas"
              , "filterable"
              , "affjax-web"
              , "console"
              , "affjax"
              , "either"
              , "monoid-extras"
              , "integers"
              , "random"
              , "behaviors"
              , "aff"
              , "argonaut-core"
              , "web-uievents"
              , "http-methods"
              , "maybe"
              , "typelevel-prelude"
              ]
        }
