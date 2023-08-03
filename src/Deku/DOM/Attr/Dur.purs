module Deku.DOM.Attr.Dur where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Dur = Dur

instance Attr Animate_ Dur (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dur bothValues = unsafeAttribute $ Both
    { key: "dur", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "dur", value: prop' value })
instance Attr Animate_ Dur  String  where
  attr Dur value = unsafeAttribute $ This $ pure $ { key: "dur", value: prop' value }
instance Attr Animate_ Dur (Event.Event  String ) where
  attr Dur eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dur", value: prop' value }

instance Attr AnimateMotion_ Dur (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dur bothValues = unsafeAttribute $ Both
    { key: "dur", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "dur", value: prop' value })
instance Attr AnimateMotion_ Dur  String  where
  attr Dur value = unsafeAttribute $ This $ pure $ { key: "dur", value: prop' value }
instance Attr AnimateMotion_ Dur (Event.Event  String ) where
  attr Dur eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dur", value: prop' value }

instance Attr AnimateTransform_ Dur (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dur bothValues = unsafeAttribute $ Both
    { key: "dur", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "dur", value: prop' value })
instance Attr AnimateTransform_ Dur  String  where
  attr Dur value = unsafeAttribute $ This $ pure $ { key: "dur", value: prop' value }
instance Attr AnimateTransform_ Dur (Event.Event  String ) where
  attr Dur eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dur", value: prop' value }

instance Attr Set_ Dur (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dur bothValues = unsafeAttribute $ Both
    { key: "dur", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "dur", value: prop' value })
instance Attr Set_ Dur  String  where
  attr Dur value = unsafeAttribute $ This $ pure $ { key: "dur", value: prop' value }
instance Attr Set_ Dur (Event.Event  String ) where
  attr Dur eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "dur", value: prop' value }

instance Attr everything Dur (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Dur bothValues = unsafeAttribute $ Both { key: "dur", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "dur", value: unset' })
instance Attr everything Dur  Unit  where
  attr Dur _ = unsafeAttribute $ This $ pure $ { key: "dur", value: unset' }
instance Attr everything Dur (Event.Event  Unit ) where
  attr Dur eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "dur", value: unset' }
