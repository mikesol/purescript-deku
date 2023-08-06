module Deku.DOM.Attr.X2 where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.Line (Line_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data X2 = X2

instance Attr Line_ X2  String  where
  attr X2 value = unsafeAttribute $ Left $  { key: "x2", value: prop' value }
instance Attr Line_ X2 (Event.Event  String ) where
  attr X2 eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "x2", value: prop' value }


instance Attr LinearGradient_ X2  String  where
  attr X2 value = unsafeAttribute $ Left $  { key: "x2", value: prop' value }
instance Attr LinearGradient_ X2 (Event.Event  String ) where
  attr X2 eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "x2", value: prop' value }


instance Attr everything X2  Unit  where
  attr X2 _ = unsafeAttribute $ Left $  { key: "x2", value: unset' }
instance Attr everything X2 (Event.Event  Unit ) where
  attr X2 eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "x2", value: unset' }
