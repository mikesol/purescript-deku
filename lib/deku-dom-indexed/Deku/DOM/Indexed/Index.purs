module Deku.DOM.Indexed.Index where

import Data.Newtype as Data.Newtype

data Indexed (r :: Row Type)

type role Indexed phantom
newtype Keyword (v :: Symbol) = Keyword String

type role Keyword phantom

derive instance Data.Newtype.Newtype (Keyword v) _
