module Deku.DOM.Attr.FontStretch where

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

data FontStretch = FontStretch

instance Attr FeBlend_ FontStretch (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStretch bothValues = unsafeAttribute $ Both
    { key: "font-stretch", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-stretch", value: prop' value })
instance Attr FeBlend_ FontStretch  String  where
  attr FontStretch value = unsafeAttribute $ This
    { key: "font-stretch", value: prop' value }
instance Attr FeBlend_ FontStretch (Event.Event  String ) where
  attr FontStretch eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-stretch", value: prop' value }

instance Attr FeColorMatrix_ FontStretch (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStretch bothValues = unsafeAttribute $ Both
    { key: "font-stretch", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-stretch", value: prop' value })
instance Attr FeColorMatrix_ FontStretch  String  where
  attr FontStretch value = unsafeAttribute $ This
    { key: "font-stretch", value: prop' value }
instance Attr FeColorMatrix_ FontStretch (Event.Event  String ) where
  attr FontStretch eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-stretch", value: prop' value }

instance Attr FeComponentTransfer_ FontStretch (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStretch bothValues = unsafeAttribute $ Both
    { key: "font-stretch", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-stretch", value: prop' value })
instance Attr FeComponentTransfer_ FontStretch  String  where
  attr FontStretch value = unsafeAttribute $ This
    { key: "font-stretch", value: prop' value }
instance Attr FeComponentTransfer_ FontStretch (Event.Event  String ) where
  attr FontStretch eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-stretch", value: prop' value }

instance Attr FeComposite_ FontStretch (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStretch bothValues = unsafeAttribute $ Both
    { key: "font-stretch", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-stretch", value: prop' value })
instance Attr FeComposite_ FontStretch  String  where
  attr FontStretch value = unsafeAttribute $ This
    { key: "font-stretch", value: prop' value }
instance Attr FeComposite_ FontStretch (Event.Event  String ) where
  attr FontStretch eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-stretch", value: prop' value }

instance Attr FeConvolveMatrix_ FontStretch (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStretch bothValues = unsafeAttribute $ Both
    { key: "font-stretch", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-stretch", value: prop' value })
instance Attr FeConvolveMatrix_ FontStretch  String  where
  attr FontStretch value = unsafeAttribute $ This
    { key: "font-stretch", value: prop' value }
instance Attr FeConvolveMatrix_ FontStretch (Event.Event  String ) where
  attr FontStretch eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-stretch", value: prop' value }

instance Attr FeDiffuseLighting_ FontStretch (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStretch bothValues = unsafeAttribute $ Both
    { key: "font-stretch", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-stretch", value: prop' value })
instance Attr FeDiffuseLighting_ FontStretch  String  where
  attr FontStretch value = unsafeAttribute $ This
    { key: "font-stretch", value: prop' value }
instance Attr FeDiffuseLighting_ FontStretch (Event.Event  String ) where
  attr FontStretch eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-stretch", value: prop' value }

instance Attr FeDisplacementMap_ FontStretch (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStretch bothValues = unsafeAttribute $ Both
    { key: "font-stretch", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-stretch", value: prop' value })
instance Attr FeDisplacementMap_ FontStretch  String  where
  attr FontStretch value = unsafeAttribute $ This
    { key: "font-stretch", value: prop' value }
instance Attr FeDisplacementMap_ FontStretch (Event.Event  String ) where
  attr FontStretch eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-stretch", value: prop' value }

instance Attr FeFlood_ FontStretch (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStretch bothValues = unsafeAttribute $ Both
    { key: "font-stretch", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-stretch", value: prop' value })
instance Attr FeFlood_ FontStretch  String  where
  attr FontStretch value = unsafeAttribute $ This
    { key: "font-stretch", value: prop' value }
instance Attr FeFlood_ FontStretch (Event.Event  String ) where
  attr FontStretch eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-stretch", value: prop' value }

instance Attr FeGaussianBlur_ FontStretch (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStretch bothValues = unsafeAttribute $ Both
    { key: "font-stretch", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-stretch", value: prop' value })
instance Attr FeGaussianBlur_ FontStretch  String  where
  attr FontStretch value = unsafeAttribute $ This
    { key: "font-stretch", value: prop' value }
instance Attr FeGaussianBlur_ FontStretch (Event.Event  String ) where
  attr FontStretch eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-stretch", value: prop' value }

instance Attr FeImage_ FontStretch (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStretch bothValues = unsafeAttribute $ Both
    { key: "font-stretch", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-stretch", value: prop' value })
instance Attr FeImage_ FontStretch  String  where
  attr FontStretch value = unsafeAttribute $ This
    { key: "font-stretch", value: prop' value }
instance Attr FeImage_ FontStretch (Event.Event  String ) where
  attr FontStretch eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-stretch", value: prop' value }

instance Attr FeMerge_ FontStretch (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStretch bothValues = unsafeAttribute $ Both
    { key: "font-stretch", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-stretch", value: prop' value })
instance Attr FeMerge_ FontStretch  String  where
  attr FontStretch value = unsafeAttribute $ This
    { key: "font-stretch", value: prop' value }
instance Attr FeMerge_ FontStretch (Event.Event  String ) where
  attr FontStretch eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-stretch", value: prop' value }

instance Attr FeMorphology_ FontStretch (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStretch bothValues = unsafeAttribute $ Both
    { key: "font-stretch", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-stretch", value: prop' value })
instance Attr FeMorphology_ FontStretch  String  where
  attr FontStretch value = unsafeAttribute $ This
    { key: "font-stretch", value: prop' value }
instance Attr FeMorphology_ FontStretch (Event.Event  String ) where
  attr FontStretch eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-stretch", value: prop' value }

instance Attr FeOffset_ FontStretch (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStretch bothValues = unsafeAttribute $ Both
    { key: "font-stretch", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-stretch", value: prop' value })
instance Attr FeOffset_ FontStretch  String  where
  attr FontStretch value = unsafeAttribute $ This
    { key: "font-stretch", value: prop' value }
instance Attr FeOffset_ FontStretch (Event.Event  String ) where
  attr FontStretch eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-stretch", value: prop' value }

instance Attr FeSpecularLighting_ FontStretch (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStretch bothValues = unsafeAttribute $ Both
    { key: "font-stretch", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-stretch", value: prop' value })
instance Attr FeSpecularLighting_ FontStretch  String  where
  attr FontStretch value = unsafeAttribute $ This
    { key: "font-stretch", value: prop' value }
instance Attr FeSpecularLighting_ FontStretch (Event.Event  String ) where
  attr FontStretch eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-stretch", value: prop' value }

instance Attr FeTile_ FontStretch (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStretch bothValues = unsafeAttribute $ Both
    { key: "font-stretch", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-stretch", value: prop' value })
instance Attr FeTile_ FontStretch  String  where
  attr FontStretch value = unsafeAttribute $ This
    { key: "font-stretch", value: prop' value }
instance Attr FeTile_ FontStretch (Event.Event  String ) where
  attr FontStretch eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-stretch", value: prop' value }

instance Attr FeTurbulence_ FontStretch (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStretch bothValues = unsafeAttribute $ Both
    { key: "font-stretch", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-stretch", value: prop' value })
instance Attr FeTurbulence_ FontStretch  String  where
  attr FontStretch value = unsafeAttribute $ This
    { key: "font-stretch", value: prop' value }
instance Attr FeTurbulence_ FontStretch (Event.Event  String ) where
  attr FontStretch eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-stretch", value: prop' value }

instance Attr Filter_ FontStretch (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStretch bothValues = unsafeAttribute $ Both
    { key: "font-stretch", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-stretch", value: prop' value })
instance Attr Filter_ FontStretch  String  where
  attr FontStretch value = unsafeAttribute $ This
    { key: "font-stretch", value: prop' value }
instance Attr Filter_ FontStretch (Event.Event  String ) where
  attr FontStretch eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-stretch", value: prop' value }

instance Attr Image_ FontStretch (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStretch bothValues = unsafeAttribute $ Both
    { key: "font-stretch", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-stretch", value: prop' value })
instance Attr Image_ FontStretch  String  where
  attr FontStretch value = unsafeAttribute $ This
    { key: "font-stretch", value: prop' value }
instance Attr Image_ FontStretch (Event.Event  String ) where
  attr FontStretch eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-stretch", value: prop' value }

instance Attr Switch_ FontStretch (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStretch bothValues = unsafeAttribute $ Both
    { key: "font-stretch", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-stretch", value: prop' value })
instance Attr Switch_ FontStretch  String  where
  attr FontStretch value = unsafeAttribute $ This
    { key: "font-stretch", value: prop' value }
instance Attr Switch_ FontStretch (Event.Event  String ) where
  attr FontStretch eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-stretch", value: prop' value }

instance Attr Text_ FontStretch (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStretch bothValues = unsafeAttribute $ Both
    { key: "font-stretch", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-stretch", value: prop' value })
instance Attr Text_ FontStretch  String  where
  attr FontStretch value = unsafeAttribute $ This
    { key: "font-stretch", value: prop' value }
instance Attr Text_ FontStretch (Event.Event  String ) where
  attr FontStretch eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-stretch", value: prop' value }

instance Attr Tspan_ FontStretch (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStretch bothValues = unsafeAttribute $ Both
    { key: "font-stretch", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "font-stretch", value: prop' value })
instance Attr Tspan_ FontStretch  String  where
  attr FontStretch value = unsafeAttribute $ This
    { key: "font-stretch", value: prop' value }
instance Attr Tspan_ FontStretch (Event.Event  String ) where
  attr FontStretch eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-stretch", value: prop' value }

instance Attr everything FontStretch (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr FontStretch bothValues = unsafeAttribute $ Both
    { key: "font-stretch", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "font-stretch", value: unset' })
instance Attr everything FontStretch  Unit  where
  attr FontStretch _ = unsafeAttribute $ This
    { key: "font-stretch", value: unset' }
instance Attr everything FontStretch (Event.Event  Unit ) where
  attr FontStretch eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "font-stretch", value: unset' }