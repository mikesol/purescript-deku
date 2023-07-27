module Deku.DOM.Indexed.Index where

import Data.Newtype as Data.Newtype
import Deku.Attribute as Deku.Attribute

data Indexed (r :: Row Type)

type role Indexed phantom
type Attribute (r :: Row Type) = Deku.Attribute.Attribute (Indexed r)
newtype Keyword (v :: Symbol) = Keyword String

type role Keyword phantom

derive instance Data.Newtype.Newtype (Keyword v) _
