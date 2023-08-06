module Deku.DOM.Attr.Scoped where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Style (Style_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Scoped = Scoped

instance Attr Style_ Scoped  String  where
  attr Scoped value = unsafeAttribute $ Left $  
    { key: "scoped", value: prop' value }
instance Attr Style_ Scoped (Event.Event  String ) where
  attr Scoped eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "scoped", value: prop' value }


instance Attr everything Scoped  Unit  where
  attr Scoped _ = unsafeAttribute $ Left $  { key: "scoped", value: unset' }
instance Attr everything Scoped (Event.Event  Unit ) where
  attr Scoped eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "scoped", value: unset' }
