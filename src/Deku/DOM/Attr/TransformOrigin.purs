module Deku.DOM.Attr.TransformOrigin where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Switch (Switch_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.DOM.Elt.FeTile (FeTile_)
import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.DOM.Elt.FeOffset (FeOffset_)
import Deku.DOM.Elt.FeMorphology (FeMorphology_)
import Deku.DOM.Elt.FeMerge (FeMerge_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.FeGaussianBlur (FeGaussianBlur_)
import Deku.DOM.Elt.FeFlood (FeFlood_)
import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.DOM.Elt.FeComponentTransfer (FeComponentTransfer_)
import Deku.DOM.Elt.FeColorMatrix (FeColorMatrix_)
import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data TransformOrigin = TransformOrigin

instance Attr FeBlend_ TransformOrigin (NonEmpty.NonEmpty Event.Event  String ) where
  attr TransformOrigin bothValues = unsafeAttribute $ Both
    { key: "transform-origin", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transform-origin", value: prop' value }
    )
instance Attr FeBlend_ TransformOrigin  String  where
  attr TransformOrigin value = unsafeAttribute $ This
    { key: "transform-origin", value: prop' value }
instance Attr FeBlend_ TransformOrigin (Event.Event  String ) where
  attr TransformOrigin eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transform-origin", value: prop' value }

instance Attr FeColorMatrix_ TransformOrigin (NonEmpty.NonEmpty Event.Event  String ) where
  attr TransformOrigin bothValues = unsafeAttribute $ Both
    { key: "transform-origin", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transform-origin", value: prop' value }
    )
instance Attr FeColorMatrix_ TransformOrigin  String  where
  attr TransformOrigin value = unsafeAttribute $ This
    { key: "transform-origin", value: prop' value }
instance Attr FeColorMatrix_ TransformOrigin (Event.Event  String ) where
  attr TransformOrigin eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transform-origin", value: prop' value }

instance Attr FeComponentTransfer_ TransformOrigin (NonEmpty.NonEmpty Event.Event  String ) where
  attr TransformOrigin bothValues = unsafeAttribute $ Both
    { key: "transform-origin", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transform-origin", value: prop' value }
    )
instance Attr FeComponentTransfer_ TransformOrigin  String  where
  attr TransformOrigin value = unsafeAttribute $ This
    { key: "transform-origin", value: prop' value }
instance Attr FeComponentTransfer_ TransformOrigin (Event.Event  String ) where
  attr TransformOrigin eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transform-origin", value: prop' value }

instance Attr FeComposite_ TransformOrigin (NonEmpty.NonEmpty Event.Event  String ) where
  attr TransformOrigin bothValues = unsafeAttribute $ Both
    { key: "transform-origin", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transform-origin", value: prop' value }
    )
instance Attr FeComposite_ TransformOrigin  String  where
  attr TransformOrigin value = unsafeAttribute $ This
    { key: "transform-origin", value: prop' value }
instance Attr FeComposite_ TransformOrigin (Event.Event  String ) where
  attr TransformOrigin eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transform-origin", value: prop' value }

instance Attr FeConvolveMatrix_ TransformOrigin (NonEmpty.NonEmpty Event.Event  String ) where
  attr TransformOrigin bothValues = unsafeAttribute $ Both
    { key: "transform-origin", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transform-origin", value: prop' value }
    )
instance Attr FeConvolveMatrix_ TransformOrigin  String  where
  attr TransformOrigin value = unsafeAttribute $ This
    { key: "transform-origin", value: prop' value }
instance Attr FeConvolveMatrix_ TransformOrigin (Event.Event  String ) where
  attr TransformOrigin eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transform-origin", value: prop' value }

instance Attr FeDiffuseLighting_ TransformOrigin (NonEmpty.NonEmpty Event.Event  String ) where
  attr TransformOrigin bothValues = unsafeAttribute $ Both
    { key: "transform-origin", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transform-origin", value: prop' value }
    )
instance Attr FeDiffuseLighting_ TransformOrigin  String  where
  attr TransformOrigin value = unsafeAttribute $ This
    { key: "transform-origin", value: prop' value }
instance Attr FeDiffuseLighting_ TransformOrigin (Event.Event  String ) where
  attr TransformOrigin eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transform-origin", value: prop' value }

instance Attr FeDisplacementMap_ TransformOrigin (NonEmpty.NonEmpty Event.Event  String ) where
  attr TransformOrigin bothValues = unsafeAttribute $ Both
    { key: "transform-origin", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transform-origin", value: prop' value }
    )
instance Attr FeDisplacementMap_ TransformOrigin  String  where
  attr TransformOrigin value = unsafeAttribute $ This
    { key: "transform-origin", value: prop' value }
instance Attr FeDisplacementMap_ TransformOrigin (Event.Event  String ) where
  attr TransformOrigin eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transform-origin", value: prop' value }

instance Attr FeFlood_ TransformOrigin (NonEmpty.NonEmpty Event.Event  String ) where
  attr TransformOrigin bothValues = unsafeAttribute $ Both
    { key: "transform-origin", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transform-origin", value: prop' value }
    )
instance Attr FeFlood_ TransformOrigin  String  where
  attr TransformOrigin value = unsafeAttribute $ This
    { key: "transform-origin", value: prop' value }
instance Attr FeFlood_ TransformOrigin (Event.Event  String ) where
  attr TransformOrigin eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transform-origin", value: prop' value }

instance Attr FeGaussianBlur_ TransformOrigin (NonEmpty.NonEmpty Event.Event  String ) where
  attr TransformOrigin bothValues = unsafeAttribute $ Both
    { key: "transform-origin", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transform-origin", value: prop' value }
    )
instance Attr FeGaussianBlur_ TransformOrigin  String  where
  attr TransformOrigin value = unsafeAttribute $ This
    { key: "transform-origin", value: prop' value }
instance Attr FeGaussianBlur_ TransformOrigin (Event.Event  String ) where
  attr TransformOrigin eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transform-origin", value: prop' value }

instance Attr FeImage_ TransformOrigin (NonEmpty.NonEmpty Event.Event  String ) where
  attr TransformOrigin bothValues = unsafeAttribute $ Both
    { key: "transform-origin", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transform-origin", value: prop' value }
    )
instance Attr FeImage_ TransformOrigin  String  where
  attr TransformOrigin value = unsafeAttribute $ This
    { key: "transform-origin", value: prop' value }
instance Attr FeImage_ TransformOrigin (Event.Event  String ) where
  attr TransformOrigin eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transform-origin", value: prop' value }

instance Attr FeMerge_ TransformOrigin (NonEmpty.NonEmpty Event.Event  String ) where
  attr TransformOrigin bothValues = unsafeAttribute $ Both
    { key: "transform-origin", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transform-origin", value: prop' value }
    )
instance Attr FeMerge_ TransformOrigin  String  where
  attr TransformOrigin value = unsafeAttribute $ This
    { key: "transform-origin", value: prop' value }
instance Attr FeMerge_ TransformOrigin (Event.Event  String ) where
  attr TransformOrigin eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transform-origin", value: prop' value }

instance Attr FeMorphology_ TransformOrigin (NonEmpty.NonEmpty Event.Event  String ) where
  attr TransformOrigin bothValues = unsafeAttribute $ Both
    { key: "transform-origin", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transform-origin", value: prop' value }
    )
instance Attr FeMorphology_ TransformOrigin  String  where
  attr TransformOrigin value = unsafeAttribute $ This
    { key: "transform-origin", value: prop' value }
instance Attr FeMorphology_ TransformOrigin (Event.Event  String ) where
  attr TransformOrigin eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transform-origin", value: prop' value }

instance Attr FeOffset_ TransformOrigin (NonEmpty.NonEmpty Event.Event  String ) where
  attr TransformOrigin bothValues = unsafeAttribute $ Both
    { key: "transform-origin", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transform-origin", value: prop' value }
    )
instance Attr FeOffset_ TransformOrigin  String  where
  attr TransformOrigin value = unsafeAttribute $ This
    { key: "transform-origin", value: prop' value }
instance Attr FeOffset_ TransformOrigin (Event.Event  String ) where
  attr TransformOrigin eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transform-origin", value: prop' value }

instance Attr FeSpecularLighting_ TransformOrigin (NonEmpty.NonEmpty Event.Event  String ) where
  attr TransformOrigin bothValues = unsafeAttribute $ Both
    { key: "transform-origin", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transform-origin", value: prop' value }
    )
instance Attr FeSpecularLighting_ TransformOrigin  String  where
  attr TransformOrigin value = unsafeAttribute $ This
    { key: "transform-origin", value: prop' value }
instance Attr FeSpecularLighting_ TransformOrigin (Event.Event  String ) where
  attr TransformOrigin eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transform-origin", value: prop' value }

instance Attr FeTile_ TransformOrigin (NonEmpty.NonEmpty Event.Event  String ) where
  attr TransformOrigin bothValues = unsafeAttribute $ Both
    { key: "transform-origin", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transform-origin", value: prop' value }
    )
instance Attr FeTile_ TransformOrigin  String  where
  attr TransformOrigin value = unsafeAttribute $ This
    { key: "transform-origin", value: prop' value }
instance Attr FeTile_ TransformOrigin (Event.Event  String ) where
  attr TransformOrigin eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transform-origin", value: prop' value }

instance Attr FeTurbulence_ TransformOrigin (NonEmpty.NonEmpty Event.Event  String ) where
  attr TransformOrigin bothValues = unsafeAttribute $ Both
    { key: "transform-origin", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transform-origin", value: prop' value }
    )
instance Attr FeTurbulence_ TransformOrigin  String  where
  attr TransformOrigin value = unsafeAttribute $ This
    { key: "transform-origin", value: prop' value }
instance Attr FeTurbulence_ TransformOrigin (Event.Event  String ) where
  attr TransformOrigin eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transform-origin", value: prop' value }

instance Attr Filter_ TransformOrigin (NonEmpty.NonEmpty Event.Event  String ) where
  attr TransformOrigin bothValues = unsafeAttribute $ Both
    { key: "transform-origin", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transform-origin", value: prop' value }
    )
instance Attr Filter_ TransformOrigin  String  where
  attr TransformOrigin value = unsafeAttribute $ This
    { key: "transform-origin", value: prop' value }
instance Attr Filter_ TransformOrigin (Event.Event  String ) where
  attr TransformOrigin eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transform-origin", value: prop' value }

instance Attr Image_ TransformOrigin (NonEmpty.NonEmpty Event.Event  String ) where
  attr TransformOrigin bothValues = unsafeAttribute $ Both
    { key: "transform-origin", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transform-origin", value: prop' value }
    )
instance Attr Image_ TransformOrigin  String  where
  attr TransformOrigin value = unsafeAttribute $ This
    { key: "transform-origin", value: prop' value }
instance Attr Image_ TransformOrigin (Event.Event  String ) where
  attr TransformOrigin eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transform-origin", value: prop' value }

instance Attr Switch_ TransformOrigin (NonEmpty.NonEmpty Event.Event  String ) where
  attr TransformOrigin bothValues = unsafeAttribute $ Both
    { key: "transform-origin", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transform-origin", value: prop' value }
    )
instance Attr Switch_ TransformOrigin  String  where
  attr TransformOrigin value = unsafeAttribute $ This
    { key: "transform-origin", value: prop' value }
instance Attr Switch_ TransformOrigin (Event.Event  String ) where
  attr TransformOrigin eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transform-origin", value: prop' value }

instance Attr everything TransformOrigin (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr TransformOrigin bothValues = unsafeAttribute $ Both
    { key: "transform-origin", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "transform-origin", value: unset' })
instance Attr everything TransformOrigin  Unit  where
  attr TransformOrigin _ = unsafeAttribute $ This
    { key: "transform-origin", value: unset' }
instance Attr everything TransformOrigin (Event.Event  Unit ) where
  attr TransformOrigin eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "transform-origin", value: unset' }