module Deku.DOM.Attr.By where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data By = By

instance Attr Animate_ By (NonEmpty.NonEmpty Event.Event  String ) where
  attr By bothValues = unsafeAttribute $ Both (pure 
    { key: "by", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "by", value: prop' value })
instance Attr Animate_ By  String  where
  attr By value = unsafeAttribute $ This $ pure $ { key: "by", value: prop' value }
instance Attr Animate_ By (Event.Event  String ) where
  attr By eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "by", value: prop' value }

instance Attr AnimateMotion_ By (NonEmpty.NonEmpty Event.Event  String ) where
  attr By bothValues = unsafeAttribute $ Both (pure 
    { key: "by", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "by", value: prop' value })
instance Attr AnimateMotion_ By  String  where
  attr By value = unsafeAttribute $ This $ pure $ { key: "by", value: prop' value }
instance Attr AnimateMotion_ By (Event.Event  String ) where
  attr By eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "by", value: prop' value }

instance Attr AnimateTransform_ By (NonEmpty.NonEmpty Event.Event  String ) where
  attr By bothValues = unsafeAttribute $ Both (pure 
    { key: "by", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "by", value: prop' value })
instance Attr AnimateTransform_ By  String  where
  attr By value = unsafeAttribute $ This $ pure $ { key: "by", value: prop' value }
instance Attr AnimateTransform_ By (Event.Event  String ) where
  attr By eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "by", value: prop' value }

instance Attr everything By (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr By bothValues = unsafeAttribute $ Both (pure  { key: "by", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "by", value: unset' })
instance Attr everything By  Unit  where
  attr By _ = unsafeAttribute $ This $ pure $ { key: "by", value: unset' }
instance Attr everything By (Event.Event  Unit ) where
  attr By eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "by", value: unset' }
