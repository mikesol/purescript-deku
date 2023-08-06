module Deku.DOM.Attr.Mode where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Mode = Mode

instance Attr FeBlend_ Mode  String  where
  attr Mode value = unsafeAttribute $ Left $  
    { key: "mode", value: prop' value }
instance Attr FeBlend_ Mode (Event.Event  String ) where
  attr Mode eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "mode", value: prop' value }


instance Attr everything Mode  Unit  where
  attr Mode _ = unsafeAttribute $ Left $  { key: "mode", value: unset' }
instance Attr everything Mode (Event.Event  Unit ) where
  attr Mode eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "mode", value: unset' }
