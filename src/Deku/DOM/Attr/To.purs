module Deku.DOM.Attr.To where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data To = To

instance Attr Animate_ To (NonEmpty.NonEmpty Event.Event  String ) where
  attr To bothValues = unsafeAttribute $ Both (pure 
    { key: "to", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "to", value: prop' value })
instance Attr Animate_ To  String  where
  attr To value = unsafeAttribute $ This $ pure $ { key: "to", value: prop' value }
instance Attr Animate_ To (Event.Event  String ) where
  attr To eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "to", value: prop' value }

instance Attr AnimateMotion_ To (NonEmpty.NonEmpty Event.Event  String ) where
  attr To bothValues = unsafeAttribute $ Both (pure 
    { key: "to", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "to", value: prop' value })
instance Attr AnimateMotion_ To  String  where
  attr To value = unsafeAttribute $ This $ pure $ { key: "to", value: prop' value }
instance Attr AnimateMotion_ To (Event.Event  String ) where
  attr To eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "to", value: prop' value }

instance Attr AnimateTransform_ To (NonEmpty.NonEmpty Event.Event  String ) where
  attr To bothValues = unsafeAttribute $ Both (pure 
    { key: "to", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "to", value: prop' value })
instance Attr AnimateTransform_ To  String  where
  attr To value = unsafeAttribute $ This $ pure $ { key: "to", value: prop' value }
instance Attr AnimateTransform_ To (Event.Event  String ) where
  attr To eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "to", value: prop' value }

instance Attr Set_ To (NonEmpty.NonEmpty Event.Event  String ) where
  attr To bothValues = unsafeAttribute $ Both (pure 
    { key: "to", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "to", value: prop' value })
instance Attr Set_ To  String  where
  attr To value = unsafeAttribute $ This $ pure $ { key: "to", value: prop' value }
instance Attr Set_ To (Event.Event  String ) where
  attr To eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "to", value: prop' value }

instance Attr everything To (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr To bothValues = unsafeAttribute $ Both (pure  { key: "to", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "to", value: unset' })
instance Attr everything To  Unit  where
  attr To _ = unsafeAttribute $ This $ pure $ { key: "to", value: unset' }
instance Attr everything To (Event.Event  Unit ) where
  attr To eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "to", value: unset' }
