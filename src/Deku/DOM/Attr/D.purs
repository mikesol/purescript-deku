module Deku.DOM.Attr.D where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Path (Path_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data D = D

instance Attr Path_ D  String  where
  attr D value = unsafeAttribute $ Left $  { key: "d", value: prop' value }
instance Attr Path_ D (Event.Event  String ) where
  attr D eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "d", value: prop' value }


instance Attr everything D  Unit  where
  attr D _ = unsafeAttribute $ Left $  { key: "d", value: unset' }
instance Attr everything D (Event.Event  Unit ) where
  attr D eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "d", value: unset' }
