module Deku.DOM.Attr.FontSizeAdjust where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.Text (Text_)
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

data FontSizeAdjust = FontSizeAdjust

instance Attr FeBlend_ FontSizeAdjust (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSizeAdjust bothValues = unsafeAttribute $ Both
    { key: "font-size-adjust", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "font-size-adjust", value: prop' value }
    )
instance Attr FeBlend_ FontSizeAdjust  String  where
  attr FontSizeAdjust value = unsafeAttribute $ This $ pure $
    { key: "font-size-adjust", value: prop' value }
instance Attr FeBlend_ FontSizeAdjust (Event.Event  String ) where
  attr FontSizeAdjust eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size-adjust", value: prop' value }

instance Attr FeColorMatrix_ FontSizeAdjust (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSizeAdjust bothValues = unsafeAttribute $ Both
    { key: "font-size-adjust", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "font-size-adjust", value: prop' value }
    )
instance Attr FeColorMatrix_ FontSizeAdjust  String  where
  attr FontSizeAdjust value = unsafeAttribute $ This $ pure $
    { key: "font-size-adjust", value: prop' value }
instance Attr FeColorMatrix_ FontSizeAdjust (Event.Event  String ) where
  attr FontSizeAdjust eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size-adjust", value: prop' value }

instance Attr FeComponentTransfer_ FontSizeAdjust (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSizeAdjust bothValues = unsafeAttribute $ Both
    { key: "font-size-adjust", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "font-size-adjust", value: prop' value }
    )
instance Attr FeComponentTransfer_ FontSizeAdjust  String  where
  attr FontSizeAdjust value = unsafeAttribute $ This $ pure $
    { key: "font-size-adjust", value: prop' value }
instance Attr FeComponentTransfer_ FontSizeAdjust (Event.Event  String ) where
  attr FontSizeAdjust eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size-adjust", value: prop' value }

instance Attr FeComposite_ FontSizeAdjust (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSizeAdjust bothValues = unsafeAttribute $ Both
    { key: "font-size-adjust", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "font-size-adjust", value: prop' value }
    )
instance Attr FeComposite_ FontSizeAdjust  String  where
  attr FontSizeAdjust value = unsafeAttribute $ This $ pure $
    { key: "font-size-adjust", value: prop' value }
instance Attr FeComposite_ FontSizeAdjust (Event.Event  String ) where
  attr FontSizeAdjust eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size-adjust", value: prop' value }

instance Attr FeConvolveMatrix_ FontSizeAdjust (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSizeAdjust bothValues = unsafeAttribute $ Both
    { key: "font-size-adjust", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "font-size-adjust", value: prop' value }
    )
instance Attr FeConvolveMatrix_ FontSizeAdjust  String  where
  attr FontSizeAdjust value = unsafeAttribute $ This $ pure $
    { key: "font-size-adjust", value: prop' value }
instance Attr FeConvolveMatrix_ FontSizeAdjust (Event.Event  String ) where
  attr FontSizeAdjust eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size-adjust", value: prop' value }

instance Attr FeDiffuseLighting_ FontSizeAdjust (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSizeAdjust bothValues = unsafeAttribute $ Both
    { key: "font-size-adjust", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "font-size-adjust", value: prop' value }
    )
instance Attr FeDiffuseLighting_ FontSizeAdjust  String  where
  attr FontSizeAdjust value = unsafeAttribute $ This $ pure $
    { key: "font-size-adjust", value: prop' value }
instance Attr FeDiffuseLighting_ FontSizeAdjust (Event.Event  String ) where
  attr FontSizeAdjust eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size-adjust", value: prop' value }

instance Attr FeDisplacementMap_ FontSizeAdjust (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSizeAdjust bothValues = unsafeAttribute $ Both
    { key: "font-size-adjust", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "font-size-adjust", value: prop' value }
    )
instance Attr FeDisplacementMap_ FontSizeAdjust  String  where
  attr FontSizeAdjust value = unsafeAttribute $ This $ pure $
    { key: "font-size-adjust", value: prop' value }
instance Attr FeDisplacementMap_ FontSizeAdjust (Event.Event  String ) where
  attr FontSizeAdjust eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size-adjust", value: prop' value }

instance Attr FeFlood_ FontSizeAdjust (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSizeAdjust bothValues = unsafeAttribute $ Both
    { key: "font-size-adjust", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "font-size-adjust", value: prop' value }
    )
instance Attr FeFlood_ FontSizeAdjust  String  where
  attr FontSizeAdjust value = unsafeAttribute $ This $ pure $
    { key: "font-size-adjust", value: prop' value }
instance Attr FeFlood_ FontSizeAdjust (Event.Event  String ) where
  attr FontSizeAdjust eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size-adjust", value: prop' value }

instance Attr FeGaussianBlur_ FontSizeAdjust (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSizeAdjust bothValues = unsafeAttribute $ Both
    { key: "font-size-adjust", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "font-size-adjust", value: prop' value }
    )
instance Attr FeGaussianBlur_ FontSizeAdjust  String  where
  attr FontSizeAdjust value = unsafeAttribute $ This $ pure $
    { key: "font-size-adjust", value: prop' value }
instance Attr FeGaussianBlur_ FontSizeAdjust (Event.Event  String ) where
  attr FontSizeAdjust eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size-adjust", value: prop' value }

instance Attr FeImage_ FontSizeAdjust (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSizeAdjust bothValues = unsafeAttribute $ Both
    { key: "font-size-adjust", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "font-size-adjust", value: prop' value }
    )
instance Attr FeImage_ FontSizeAdjust  String  where
  attr FontSizeAdjust value = unsafeAttribute $ This $ pure $
    { key: "font-size-adjust", value: prop' value }
instance Attr FeImage_ FontSizeAdjust (Event.Event  String ) where
  attr FontSizeAdjust eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size-adjust", value: prop' value }

instance Attr FeMerge_ FontSizeAdjust (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSizeAdjust bothValues = unsafeAttribute $ Both
    { key: "font-size-adjust", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "font-size-adjust", value: prop' value }
    )
instance Attr FeMerge_ FontSizeAdjust  String  where
  attr FontSizeAdjust value = unsafeAttribute $ This $ pure $
    { key: "font-size-adjust", value: prop' value }
instance Attr FeMerge_ FontSizeAdjust (Event.Event  String ) where
  attr FontSizeAdjust eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size-adjust", value: prop' value }

instance Attr FeMorphology_ FontSizeAdjust (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSizeAdjust bothValues = unsafeAttribute $ Both
    { key: "font-size-adjust", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "font-size-adjust", value: prop' value }
    )
instance Attr FeMorphology_ FontSizeAdjust  String  where
  attr FontSizeAdjust value = unsafeAttribute $ This $ pure $
    { key: "font-size-adjust", value: prop' value }
instance Attr FeMorphology_ FontSizeAdjust (Event.Event  String ) where
  attr FontSizeAdjust eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size-adjust", value: prop' value }

instance Attr FeOffset_ FontSizeAdjust (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSizeAdjust bothValues = unsafeAttribute $ Both
    { key: "font-size-adjust", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "font-size-adjust", value: prop' value }
    )
instance Attr FeOffset_ FontSizeAdjust  String  where
  attr FontSizeAdjust value = unsafeAttribute $ This $ pure $
    { key: "font-size-adjust", value: prop' value }
instance Attr FeOffset_ FontSizeAdjust (Event.Event  String ) where
  attr FontSizeAdjust eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size-adjust", value: prop' value }

instance Attr FeSpecularLighting_ FontSizeAdjust (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSizeAdjust bothValues = unsafeAttribute $ Both
    { key: "font-size-adjust", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "font-size-adjust", value: prop' value }
    )
instance Attr FeSpecularLighting_ FontSizeAdjust  String  where
  attr FontSizeAdjust value = unsafeAttribute $ This $ pure $
    { key: "font-size-adjust", value: prop' value }
instance Attr FeSpecularLighting_ FontSizeAdjust (Event.Event  String ) where
  attr FontSizeAdjust eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size-adjust", value: prop' value }

instance Attr FeTile_ FontSizeAdjust (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSizeAdjust bothValues = unsafeAttribute $ Both
    { key: "font-size-adjust", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "font-size-adjust", value: prop' value }
    )
instance Attr FeTile_ FontSizeAdjust  String  where
  attr FontSizeAdjust value = unsafeAttribute $ This $ pure $
    { key: "font-size-adjust", value: prop' value }
instance Attr FeTile_ FontSizeAdjust (Event.Event  String ) where
  attr FontSizeAdjust eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size-adjust", value: prop' value }

instance Attr FeTurbulence_ FontSizeAdjust (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSizeAdjust bothValues = unsafeAttribute $ Both
    { key: "font-size-adjust", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "font-size-adjust", value: prop' value }
    )
instance Attr FeTurbulence_ FontSizeAdjust  String  where
  attr FontSizeAdjust value = unsafeAttribute $ This $ pure $
    { key: "font-size-adjust", value: prop' value }
instance Attr FeTurbulence_ FontSizeAdjust (Event.Event  String ) where
  attr FontSizeAdjust eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size-adjust", value: prop' value }

instance Attr Filter_ FontSizeAdjust (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSizeAdjust bothValues = unsafeAttribute $ Both
    { key: "font-size-adjust", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "font-size-adjust", value: prop' value }
    )
instance Attr Filter_ FontSizeAdjust  String  where
  attr FontSizeAdjust value = unsafeAttribute $ This $ pure $
    { key: "font-size-adjust", value: prop' value }
instance Attr Filter_ FontSizeAdjust (Event.Event  String ) where
  attr FontSizeAdjust eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size-adjust", value: prop' value }

instance Attr Image_ FontSizeAdjust (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSizeAdjust bothValues = unsafeAttribute $ Both
    { key: "font-size-adjust", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "font-size-adjust", value: prop' value }
    )
instance Attr Image_ FontSizeAdjust  String  where
  attr FontSizeAdjust value = unsafeAttribute $ This $ pure $
    { key: "font-size-adjust", value: prop' value }
instance Attr Image_ FontSizeAdjust (Event.Event  String ) where
  attr FontSizeAdjust eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size-adjust", value: prop' value }

instance Attr Switch_ FontSizeAdjust (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSizeAdjust bothValues = unsafeAttribute $ Both
    { key: "font-size-adjust", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "font-size-adjust", value: prop' value }
    )
instance Attr Switch_ FontSizeAdjust  String  where
  attr FontSizeAdjust value = unsafeAttribute $ This $ pure $
    { key: "font-size-adjust", value: prop' value }
instance Attr Switch_ FontSizeAdjust (Event.Event  String ) where
  attr FontSizeAdjust eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size-adjust", value: prop' value }

instance Attr Text_ FontSizeAdjust (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSizeAdjust bothValues = unsafeAttribute $ Both
    { key: "font-size-adjust", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "font-size-adjust", value: prop' value }
    )
instance Attr Text_ FontSizeAdjust  String  where
  attr FontSizeAdjust value = unsafeAttribute $ This $ pure $
    { key: "font-size-adjust", value: prop' value }
instance Attr Text_ FontSizeAdjust (Event.Event  String ) where
  attr FontSizeAdjust eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size-adjust", value: prop' value }

instance Attr Tspan_ FontSizeAdjust (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSizeAdjust bothValues = unsafeAttribute $ Both
    { key: "font-size-adjust", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "font-size-adjust", value: prop' value }
    )
instance Attr Tspan_ FontSizeAdjust  String  where
  attr FontSizeAdjust value = unsafeAttribute $ This $ pure $
    { key: "font-size-adjust", value: prop' value }
instance Attr Tspan_ FontSizeAdjust (Event.Event  String ) where
  attr FontSizeAdjust eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size-adjust", value: prop' value }

instance Attr everything FontSizeAdjust (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr FontSizeAdjust bothValues = unsafeAttribute $ Both
    { key: "font-size-adjust", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "font-size-adjust", value: unset' })
instance Attr everything FontSizeAdjust  Unit  where
  attr FontSizeAdjust _ = unsafeAttribute $ This $ pure $
    { key: "font-size-adjust", value: unset' }
instance Attr everything FontSizeAdjust (Event.Event  Unit ) where
  attr FontSizeAdjust eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "font-size-adjust", value: unset' }
