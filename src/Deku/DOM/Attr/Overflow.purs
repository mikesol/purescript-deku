module Deku.DOM.Attr.Overflow where

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

data Overflow = Overflow

instance Attr FeBlend_ Overflow (NonEmpty.NonEmpty Event.Event  String ) where
  attr Overflow bothValues = unsafeAttribute $ Both
    { key: "overflow", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "overflow", value: prop' value })
instance Attr FeBlend_ Overflow  String  where
  attr Overflow value = unsafeAttribute $ This
    { key: "overflow", value: prop' value }
instance Attr FeBlend_ Overflow (Event.Event  String ) where
  attr Overflow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "overflow", value: prop' value }

instance Attr FeColorMatrix_ Overflow (NonEmpty.NonEmpty Event.Event  String ) where
  attr Overflow bothValues = unsafeAttribute $ Both
    { key: "overflow", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "overflow", value: prop' value })
instance Attr FeColorMatrix_ Overflow  String  where
  attr Overflow value = unsafeAttribute $ This
    { key: "overflow", value: prop' value }
instance Attr FeColorMatrix_ Overflow (Event.Event  String ) where
  attr Overflow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "overflow", value: prop' value }

instance Attr FeComponentTransfer_ Overflow (NonEmpty.NonEmpty Event.Event  String ) where
  attr Overflow bothValues = unsafeAttribute $ Both
    { key: "overflow", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "overflow", value: prop' value })
instance Attr FeComponentTransfer_ Overflow  String  where
  attr Overflow value = unsafeAttribute $ This
    { key: "overflow", value: prop' value }
instance Attr FeComponentTransfer_ Overflow (Event.Event  String ) where
  attr Overflow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "overflow", value: prop' value }

instance Attr FeComposite_ Overflow (NonEmpty.NonEmpty Event.Event  String ) where
  attr Overflow bothValues = unsafeAttribute $ Both
    { key: "overflow", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "overflow", value: prop' value })
instance Attr FeComposite_ Overflow  String  where
  attr Overflow value = unsafeAttribute $ This
    { key: "overflow", value: prop' value }
instance Attr FeComposite_ Overflow (Event.Event  String ) where
  attr Overflow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "overflow", value: prop' value }

instance Attr FeConvolveMatrix_ Overflow (NonEmpty.NonEmpty Event.Event  String ) where
  attr Overflow bothValues = unsafeAttribute $ Both
    { key: "overflow", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "overflow", value: prop' value })
instance Attr FeConvolveMatrix_ Overflow  String  where
  attr Overflow value = unsafeAttribute $ This
    { key: "overflow", value: prop' value }
instance Attr FeConvolveMatrix_ Overflow (Event.Event  String ) where
  attr Overflow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "overflow", value: prop' value }

instance Attr FeDiffuseLighting_ Overflow (NonEmpty.NonEmpty Event.Event  String ) where
  attr Overflow bothValues = unsafeAttribute $ Both
    { key: "overflow", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "overflow", value: prop' value })
instance Attr FeDiffuseLighting_ Overflow  String  where
  attr Overflow value = unsafeAttribute $ This
    { key: "overflow", value: prop' value }
instance Attr FeDiffuseLighting_ Overflow (Event.Event  String ) where
  attr Overflow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "overflow", value: prop' value }

instance Attr FeDisplacementMap_ Overflow (NonEmpty.NonEmpty Event.Event  String ) where
  attr Overflow bothValues = unsafeAttribute $ Both
    { key: "overflow", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "overflow", value: prop' value })
instance Attr FeDisplacementMap_ Overflow  String  where
  attr Overflow value = unsafeAttribute $ This
    { key: "overflow", value: prop' value }
instance Attr FeDisplacementMap_ Overflow (Event.Event  String ) where
  attr Overflow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "overflow", value: prop' value }

instance Attr FeFlood_ Overflow (NonEmpty.NonEmpty Event.Event  String ) where
  attr Overflow bothValues = unsafeAttribute $ Both
    { key: "overflow", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "overflow", value: prop' value })
instance Attr FeFlood_ Overflow  String  where
  attr Overflow value = unsafeAttribute $ This
    { key: "overflow", value: prop' value }
instance Attr FeFlood_ Overflow (Event.Event  String ) where
  attr Overflow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "overflow", value: prop' value }

instance Attr FeGaussianBlur_ Overflow (NonEmpty.NonEmpty Event.Event  String ) where
  attr Overflow bothValues = unsafeAttribute $ Both
    { key: "overflow", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "overflow", value: prop' value })
instance Attr FeGaussianBlur_ Overflow  String  where
  attr Overflow value = unsafeAttribute $ This
    { key: "overflow", value: prop' value }
instance Attr FeGaussianBlur_ Overflow (Event.Event  String ) where
  attr Overflow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "overflow", value: prop' value }

instance Attr FeImage_ Overflow (NonEmpty.NonEmpty Event.Event  String ) where
  attr Overflow bothValues = unsafeAttribute $ Both
    { key: "overflow", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "overflow", value: prop' value })
instance Attr FeImage_ Overflow  String  where
  attr Overflow value = unsafeAttribute $ This
    { key: "overflow", value: prop' value }
instance Attr FeImage_ Overflow (Event.Event  String ) where
  attr Overflow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "overflow", value: prop' value }

instance Attr FeMerge_ Overflow (NonEmpty.NonEmpty Event.Event  String ) where
  attr Overflow bothValues = unsafeAttribute $ Both
    { key: "overflow", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "overflow", value: prop' value })
instance Attr FeMerge_ Overflow  String  where
  attr Overflow value = unsafeAttribute $ This
    { key: "overflow", value: prop' value }
instance Attr FeMerge_ Overflow (Event.Event  String ) where
  attr Overflow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "overflow", value: prop' value }

instance Attr FeMorphology_ Overflow (NonEmpty.NonEmpty Event.Event  String ) where
  attr Overflow bothValues = unsafeAttribute $ Both
    { key: "overflow", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "overflow", value: prop' value })
instance Attr FeMorphology_ Overflow  String  where
  attr Overflow value = unsafeAttribute $ This
    { key: "overflow", value: prop' value }
instance Attr FeMorphology_ Overflow (Event.Event  String ) where
  attr Overflow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "overflow", value: prop' value }

instance Attr FeOffset_ Overflow (NonEmpty.NonEmpty Event.Event  String ) where
  attr Overflow bothValues = unsafeAttribute $ Both
    { key: "overflow", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "overflow", value: prop' value })
instance Attr FeOffset_ Overflow  String  where
  attr Overflow value = unsafeAttribute $ This
    { key: "overflow", value: prop' value }
instance Attr FeOffset_ Overflow (Event.Event  String ) where
  attr Overflow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "overflow", value: prop' value }

instance Attr FeSpecularLighting_ Overflow (NonEmpty.NonEmpty Event.Event  String ) where
  attr Overflow bothValues = unsafeAttribute $ Both
    { key: "overflow", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "overflow", value: prop' value })
instance Attr FeSpecularLighting_ Overflow  String  where
  attr Overflow value = unsafeAttribute $ This
    { key: "overflow", value: prop' value }
instance Attr FeSpecularLighting_ Overflow (Event.Event  String ) where
  attr Overflow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "overflow", value: prop' value }

instance Attr FeTile_ Overflow (NonEmpty.NonEmpty Event.Event  String ) where
  attr Overflow bothValues = unsafeAttribute $ Both
    { key: "overflow", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "overflow", value: prop' value })
instance Attr FeTile_ Overflow  String  where
  attr Overflow value = unsafeAttribute $ This
    { key: "overflow", value: prop' value }
instance Attr FeTile_ Overflow (Event.Event  String ) where
  attr Overflow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "overflow", value: prop' value }

instance Attr FeTurbulence_ Overflow (NonEmpty.NonEmpty Event.Event  String ) where
  attr Overflow bothValues = unsafeAttribute $ Both
    { key: "overflow", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "overflow", value: prop' value })
instance Attr FeTurbulence_ Overflow  String  where
  attr Overflow value = unsafeAttribute $ This
    { key: "overflow", value: prop' value }
instance Attr FeTurbulence_ Overflow (Event.Event  String ) where
  attr Overflow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "overflow", value: prop' value }

instance Attr Filter_ Overflow (NonEmpty.NonEmpty Event.Event  String ) where
  attr Overflow bothValues = unsafeAttribute $ Both
    { key: "overflow", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "overflow", value: prop' value })
instance Attr Filter_ Overflow  String  where
  attr Overflow value = unsafeAttribute $ This
    { key: "overflow", value: prop' value }
instance Attr Filter_ Overflow (Event.Event  String ) where
  attr Overflow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "overflow", value: prop' value }

instance Attr Image_ Overflow (NonEmpty.NonEmpty Event.Event  String ) where
  attr Overflow bothValues = unsafeAttribute $ Both
    { key: "overflow", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "overflow", value: prop' value })
instance Attr Image_ Overflow  String  where
  attr Overflow value = unsafeAttribute $ This
    { key: "overflow", value: prop' value }
instance Attr Image_ Overflow (Event.Event  String ) where
  attr Overflow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "overflow", value: prop' value }

instance Attr Switch_ Overflow (NonEmpty.NonEmpty Event.Event  String ) where
  attr Overflow bothValues = unsafeAttribute $ Both
    { key: "overflow", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "overflow", value: prop' value })
instance Attr Switch_ Overflow  String  where
  attr Overflow value = unsafeAttribute $ This
    { key: "overflow", value: prop' value }
instance Attr Switch_ Overflow (Event.Event  String ) where
  attr Overflow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "overflow", value: prop' value }

instance Attr everything Overflow (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Overflow bothValues = unsafeAttribute $ Both
    { key: "overflow", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "overflow", value: unset' })
instance Attr everything Overflow  Unit  where
  attr Overflow _ = unsafeAttribute $ This
    { key: "overflow", value: unset' }
instance Attr everything Overflow (Event.Event  Unit ) where
  attr Overflow eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "overflow", value: unset' }