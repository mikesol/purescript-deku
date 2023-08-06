module Deku.DOM.Attr.K4 where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data K4 = K4

instance Attr FeComposite_ K4  String  where
  attr K4 value = unsafeAttribute $ Left $  { key: "k4", value: prop' value }
instance Attr FeComposite_ K4 (Event.Event  String ) where
  attr K4 eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "k4", value: prop' value }


instance Attr everything K4  Unit  where
  attr K4 _ = unsafeAttribute $ Left $  { key: "k4", value: unset' }
instance Attr everything K4 (Event.Event  Unit ) where
  attr K4 eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "k4", value: unset' }
