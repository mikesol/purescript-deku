module DOM where

import Prelude

import Control.Monad.Except (ExceptT)
import DOM.Spec (Definition, InterfaceSpec, KeywordSpec, Tag, TagSpec, IDL)
import Effect.Aff (Aff, Error)

generate :: Array Definition -> Array Tag -> IDL -> ExceptT Error Aff Unit
generate _ tags interface =
    pure unit