module Deku.DOM.Attr.PreserveAspectRatio where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.View (View_)
import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PreserveAspectRatio = PreserveAspectRatio

instance Attr FeImage_ PreserveAspectRatio String where
  attr PreserveAspectRatio bothValues = unsafeAttribute $ Both
    { key: "preserveAspectRatio", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "preserveAspectRatio", value: prop' value }
    )
  pureAttr PreserveAspectRatio value = unsafeAttribute $ This
    { key: "preserveAspectRatio", value: prop' value }
  unpureAttr PreserveAspectRatio eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "preserveAspectRatio", value: prop' value }

instance Attr Image_ PreserveAspectRatio String where
  attr PreserveAspectRatio bothValues = unsafeAttribute $ Both
    { key: "preserveAspectRatio", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "preserveAspectRatio", value: prop' value }
    )
  pureAttr PreserveAspectRatio value = unsafeAttribute $ This
    { key: "preserveAspectRatio", value: prop' value }
  unpureAttr PreserveAspectRatio eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "preserveAspectRatio", value: prop' value }

instance Attr Marker_ PreserveAspectRatio String where
  attr PreserveAspectRatio bothValues = unsafeAttribute $ Both
    { key: "preserveAspectRatio", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "preserveAspectRatio", value: prop' value }
    )
  pureAttr PreserveAspectRatio value = unsafeAttribute $ This
    { key: "preserveAspectRatio", value: prop' value }
  unpureAttr PreserveAspectRatio eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "preserveAspectRatio", value: prop' value }

instance Attr Pattern_ PreserveAspectRatio String where
  attr PreserveAspectRatio bothValues = unsafeAttribute $ Both
    { key: "preserveAspectRatio", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "preserveAspectRatio", value: prop' value }
    )
  pureAttr PreserveAspectRatio value = unsafeAttribute $ This
    { key: "preserveAspectRatio", value: prop' value }
  unpureAttr PreserveAspectRatio eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "preserveAspectRatio", value: prop' value }

instance Attr Svg_ PreserveAspectRatio String where
  attr PreserveAspectRatio bothValues = unsafeAttribute $ Both
    { key: "preserveAspectRatio", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "preserveAspectRatio", value: prop' value }
    )
  pureAttr PreserveAspectRatio value = unsafeAttribute $ This
    { key: "preserveAspectRatio", value: prop' value }
  unpureAttr PreserveAspectRatio eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "preserveAspectRatio", value: prop' value }

instance Attr Symbol_ PreserveAspectRatio String where
  attr PreserveAspectRatio bothValues = unsafeAttribute $ Both
    { key: "preserveAspectRatio", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "preserveAspectRatio", value: prop' value }
    )
  pureAttr PreserveAspectRatio value = unsafeAttribute $ This
    { key: "preserveAspectRatio", value: prop' value }
  unpureAttr PreserveAspectRatio eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "preserveAspectRatio", value: prop' value }

instance Attr View_ PreserveAspectRatio String where
  attr PreserveAspectRatio bothValues = unsafeAttribute $ Both
    { key: "preserveAspectRatio", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "preserveAspectRatio", value: prop' value }
    )
  pureAttr PreserveAspectRatio value = unsafeAttribute $ This
    { key: "preserveAspectRatio", value: prop' value }
  unpureAttr PreserveAspectRatio eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "preserveAspectRatio", value: prop' value }

instance Attr everything PreserveAspectRatio Unit where
  attr PreserveAspectRatio bothValues = unsafeAttribute $ Both
    { key: "preserveAspectRatio", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "preserveAspectRatio", value: unset' })
  pureAttr PreserveAspectRatio _ = unsafeAttribute $ This
    { key: "preserveAspectRatio", value: unset' }
  unpureAttr PreserveAspectRatio eventValue = unsafeAttribute $ That $
    eventValue <#> \_ -> { key: "preserveAspectRatio", value: unset' }
