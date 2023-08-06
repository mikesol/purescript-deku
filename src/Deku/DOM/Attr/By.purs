module Deku.DOM.Attr.By where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data By = By

instance Attr Animate_ By  String  where
  attr By value = unsafeAttribute $ Left $  { key: "by", value: prop' value }
instance Attr Animate_ By (Event.Event  String ) where
  attr By eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "by", value: prop' value }


instance Attr AnimateMotion_ By  String  where
  attr By value = unsafeAttribute $ Left $  { key: "by", value: prop' value }
instance Attr AnimateMotion_ By (Event.Event  String ) where
  attr By eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "by", value: prop' value }


instance Attr AnimateTransform_ By  String  where
  attr By value = unsafeAttribute $ Left $  { key: "by", value: prop' value }
instance Attr AnimateTransform_ By (Event.Event  String ) where
  attr By eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "by", value: prop' value }


instance Attr everything By  Unit  where
  attr By _ = unsafeAttribute $ Left $  { key: "by", value: unset' }
instance Attr everything By (Event.Event  Unit ) where
  attr By eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "by", value: unset' }
