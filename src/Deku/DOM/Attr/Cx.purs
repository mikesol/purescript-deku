module Deku.DOM.Attr.Cx where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.DOM.Elt.Circle (Circle_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Cx = Cx

instance Attr Circle_ Cx (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cx bothValues = unsafeAttribute $ Both (pure 
    { key: "cx", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "cx", value: prop' value })
instance Attr Circle_ Cx  String  where
  attr Cx value = unsafeAttribute $ This $ pure $ { key: "cx", value: prop' value }
instance Attr Circle_ Cx (Event.Event  String ) where
  attr Cx eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "cx", value: prop' value }

instance Attr Ellipse_ Cx (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cx bothValues = unsafeAttribute $ Both (pure 
    { key: "cx", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "cx", value: prop' value })
instance Attr Ellipse_ Cx  String  where
  attr Cx value = unsafeAttribute $ This $ pure $ { key: "cx", value: prop' value }
instance Attr Ellipse_ Cx (Event.Event  String ) where
  attr Cx eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "cx", value: prop' value }

instance Attr RadialGradient_ Cx (NonEmpty.NonEmpty Event.Event  String ) where
  attr Cx bothValues = unsafeAttribute $ Both (pure 
    { key: "cx", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "cx", value: prop' value })
instance Attr RadialGradient_ Cx  String  where
  attr Cx value = unsafeAttribute $ This $ pure $ { key: "cx", value: prop' value }
instance Attr RadialGradient_ Cx (Event.Event  String ) where
  attr Cx eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "cx", value: prop' value }

instance Attr everything Cx (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Cx bothValues = unsafeAttribute $ Both (pure  { key: "cx", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "cx", value: unset' })
instance Attr everything Cx  Unit  where
  attr Cx _ = unsafeAttribute $ This $ pure $ { key: "cx", value: unset' }
instance Attr everything Cx (Event.Event  Unit ) where
  attr Cx eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "cx", value: unset' }
