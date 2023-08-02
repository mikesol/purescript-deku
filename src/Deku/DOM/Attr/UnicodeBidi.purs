module Deku.DOM.Attr.UnicodeBidi where

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

data UnicodeBidi = UnicodeBidi

instance Attr FeBlend_ UnicodeBidi (NonEmpty.NonEmpty Event.Event  String ) where
  attr UnicodeBidi bothValues = unsafeAttribute $ Both
    { key: "unicode-bidi", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "unicode-bidi", value: prop' value })
instance Attr FeBlend_ UnicodeBidi  String  where
  attr UnicodeBidi value = unsafeAttribute $ This
    { key: "unicode-bidi", value: prop' value }
instance Attr FeBlend_ UnicodeBidi (Event.Event  String ) where
  attr UnicodeBidi eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "unicode-bidi", value: prop' value }

instance Attr FeColorMatrix_ UnicodeBidi (NonEmpty.NonEmpty Event.Event  String ) where
  attr UnicodeBidi bothValues = unsafeAttribute $ Both
    { key: "unicode-bidi", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "unicode-bidi", value: prop' value })
instance Attr FeColorMatrix_ UnicodeBidi  String  where
  attr UnicodeBidi value = unsafeAttribute $ This
    { key: "unicode-bidi", value: prop' value }
instance Attr FeColorMatrix_ UnicodeBidi (Event.Event  String ) where
  attr UnicodeBidi eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "unicode-bidi", value: prop' value }

instance Attr FeComponentTransfer_ UnicodeBidi (NonEmpty.NonEmpty Event.Event  String ) where
  attr UnicodeBidi bothValues = unsafeAttribute $ Both
    { key: "unicode-bidi", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "unicode-bidi", value: prop' value })
instance Attr FeComponentTransfer_ UnicodeBidi  String  where
  attr UnicodeBidi value = unsafeAttribute $ This
    { key: "unicode-bidi", value: prop' value }
instance Attr FeComponentTransfer_ UnicodeBidi (Event.Event  String ) where
  attr UnicodeBidi eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "unicode-bidi", value: prop' value }

instance Attr FeComposite_ UnicodeBidi (NonEmpty.NonEmpty Event.Event  String ) where
  attr UnicodeBidi bothValues = unsafeAttribute $ Both
    { key: "unicode-bidi", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "unicode-bidi", value: prop' value })
instance Attr FeComposite_ UnicodeBidi  String  where
  attr UnicodeBidi value = unsafeAttribute $ This
    { key: "unicode-bidi", value: prop' value }
instance Attr FeComposite_ UnicodeBidi (Event.Event  String ) where
  attr UnicodeBidi eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "unicode-bidi", value: prop' value }

instance Attr FeConvolveMatrix_ UnicodeBidi (NonEmpty.NonEmpty Event.Event  String ) where
  attr UnicodeBidi bothValues = unsafeAttribute $ Both
    { key: "unicode-bidi", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "unicode-bidi", value: prop' value })
instance Attr FeConvolveMatrix_ UnicodeBidi  String  where
  attr UnicodeBidi value = unsafeAttribute $ This
    { key: "unicode-bidi", value: prop' value }
instance Attr FeConvolveMatrix_ UnicodeBidi (Event.Event  String ) where
  attr UnicodeBidi eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "unicode-bidi", value: prop' value }

instance Attr FeDiffuseLighting_ UnicodeBidi (NonEmpty.NonEmpty Event.Event  String ) where
  attr UnicodeBidi bothValues = unsafeAttribute $ Both
    { key: "unicode-bidi", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "unicode-bidi", value: prop' value })
instance Attr FeDiffuseLighting_ UnicodeBidi  String  where
  attr UnicodeBidi value = unsafeAttribute $ This
    { key: "unicode-bidi", value: prop' value }
instance Attr FeDiffuseLighting_ UnicodeBidi (Event.Event  String ) where
  attr UnicodeBidi eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "unicode-bidi", value: prop' value }

instance Attr FeDisplacementMap_ UnicodeBidi (NonEmpty.NonEmpty Event.Event  String ) where
  attr UnicodeBidi bothValues = unsafeAttribute $ Both
    { key: "unicode-bidi", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "unicode-bidi", value: prop' value })
instance Attr FeDisplacementMap_ UnicodeBidi  String  where
  attr UnicodeBidi value = unsafeAttribute $ This
    { key: "unicode-bidi", value: prop' value }
instance Attr FeDisplacementMap_ UnicodeBidi (Event.Event  String ) where
  attr UnicodeBidi eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "unicode-bidi", value: prop' value }

instance Attr FeFlood_ UnicodeBidi (NonEmpty.NonEmpty Event.Event  String ) where
  attr UnicodeBidi bothValues = unsafeAttribute $ Both
    { key: "unicode-bidi", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "unicode-bidi", value: prop' value })
instance Attr FeFlood_ UnicodeBidi  String  where
  attr UnicodeBidi value = unsafeAttribute $ This
    { key: "unicode-bidi", value: prop' value }
instance Attr FeFlood_ UnicodeBidi (Event.Event  String ) where
  attr UnicodeBidi eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "unicode-bidi", value: prop' value }

instance Attr FeGaussianBlur_ UnicodeBidi (NonEmpty.NonEmpty Event.Event  String ) where
  attr UnicodeBidi bothValues = unsafeAttribute $ Both
    { key: "unicode-bidi", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "unicode-bidi", value: prop' value })
instance Attr FeGaussianBlur_ UnicodeBidi  String  where
  attr UnicodeBidi value = unsafeAttribute $ This
    { key: "unicode-bidi", value: prop' value }
instance Attr FeGaussianBlur_ UnicodeBidi (Event.Event  String ) where
  attr UnicodeBidi eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "unicode-bidi", value: prop' value }

instance Attr FeImage_ UnicodeBidi (NonEmpty.NonEmpty Event.Event  String ) where
  attr UnicodeBidi bothValues = unsafeAttribute $ Both
    { key: "unicode-bidi", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "unicode-bidi", value: prop' value })
instance Attr FeImage_ UnicodeBidi  String  where
  attr UnicodeBidi value = unsafeAttribute $ This
    { key: "unicode-bidi", value: prop' value }
instance Attr FeImage_ UnicodeBidi (Event.Event  String ) where
  attr UnicodeBidi eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "unicode-bidi", value: prop' value }

instance Attr FeMerge_ UnicodeBidi (NonEmpty.NonEmpty Event.Event  String ) where
  attr UnicodeBidi bothValues = unsafeAttribute $ Both
    { key: "unicode-bidi", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "unicode-bidi", value: prop' value })
instance Attr FeMerge_ UnicodeBidi  String  where
  attr UnicodeBidi value = unsafeAttribute $ This
    { key: "unicode-bidi", value: prop' value }
instance Attr FeMerge_ UnicodeBidi (Event.Event  String ) where
  attr UnicodeBidi eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "unicode-bidi", value: prop' value }

instance Attr FeMorphology_ UnicodeBidi (NonEmpty.NonEmpty Event.Event  String ) where
  attr UnicodeBidi bothValues = unsafeAttribute $ Both
    { key: "unicode-bidi", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "unicode-bidi", value: prop' value })
instance Attr FeMorphology_ UnicodeBidi  String  where
  attr UnicodeBidi value = unsafeAttribute $ This
    { key: "unicode-bidi", value: prop' value }
instance Attr FeMorphology_ UnicodeBidi (Event.Event  String ) where
  attr UnicodeBidi eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "unicode-bidi", value: prop' value }

instance Attr FeOffset_ UnicodeBidi (NonEmpty.NonEmpty Event.Event  String ) where
  attr UnicodeBidi bothValues = unsafeAttribute $ Both
    { key: "unicode-bidi", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "unicode-bidi", value: prop' value })
instance Attr FeOffset_ UnicodeBidi  String  where
  attr UnicodeBidi value = unsafeAttribute $ This
    { key: "unicode-bidi", value: prop' value }
instance Attr FeOffset_ UnicodeBidi (Event.Event  String ) where
  attr UnicodeBidi eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "unicode-bidi", value: prop' value }

instance Attr FeSpecularLighting_ UnicodeBidi (NonEmpty.NonEmpty Event.Event  String ) where
  attr UnicodeBidi bothValues = unsafeAttribute $ Both
    { key: "unicode-bidi", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "unicode-bidi", value: prop' value })
instance Attr FeSpecularLighting_ UnicodeBidi  String  where
  attr UnicodeBidi value = unsafeAttribute $ This
    { key: "unicode-bidi", value: prop' value }
instance Attr FeSpecularLighting_ UnicodeBidi (Event.Event  String ) where
  attr UnicodeBidi eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "unicode-bidi", value: prop' value }

instance Attr FeTile_ UnicodeBidi (NonEmpty.NonEmpty Event.Event  String ) where
  attr UnicodeBidi bothValues = unsafeAttribute $ Both
    { key: "unicode-bidi", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "unicode-bidi", value: prop' value })
instance Attr FeTile_ UnicodeBidi  String  where
  attr UnicodeBidi value = unsafeAttribute $ This
    { key: "unicode-bidi", value: prop' value }
instance Attr FeTile_ UnicodeBidi (Event.Event  String ) where
  attr UnicodeBidi eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "unicode-bidi", value: prop' value }

instance Attr FeTurbulence_ UnicodeBidi (NonEmpty.NonEmpty Event.Event  String ) where
  attr UnicodeBidi bothValues = unsafeAttribute $ Both
    { key: "unicode-bidi", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "unicode-bidi", value: prop' value })
instance Attr FeTurbulence_ UnicodeBidi  String  where
  attr UnicodeBidi value = unsafeAttribute $ This
    { key: "unicode-bidi", value: prop' value }
instance Attr FeTurbulence_ UnicodeBidi (Event.Event  String ) where
  attr UnicodeBidi eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "unicode-bidi", value: prop' value }

instance Attr Filter_ UnicodeBidi (NonEmpty.NonEmpty Event.Event  String ) where
  attr UnicodeBidi bothValues = unsafeAttribute $ Both
    { key: "unicode-bidi", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "unicode-bidi", value: prop' value })
instance Attr Filter_ UnicodeBidi  String  where
  attr UnicodeBidi value = unsafeAttribute $ This
    { key: "unicode-bidi", value: prop' value }
instance Attr Filter_ UnicodeBidi (Event.Event  String ) where
  attr UnicodeBidi eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "unicode-bidi", value: prop' value }

instance Attr Image_ UnicodeBidi (NonEmpty.NonEmpty Event.Event  String ) where
  attr UnicodeBidi bothValues = unsafeAttribute $ Both
    { key: "unicode-bidi", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "unicode-bidi", value: prop' value })
instance Attr Image_ UnicodeBidi  String  where
  attr UnicodeBidi value = unsafeAttribute $ This
    { key: "unicode-bidi", value: prop' value }
instance Attr Image_ UnicodeBidi (Event.Event  String ) where
  attr UnicodeBidi eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "unicode-bidi", value: prop' value }

instance Attr Switch_ UnicodeBidi (NonEmpty.NonEmpty Event.Event  String ) where
  attr UnicodeBidi bothValues = unsafeAttribute $ Both
    { key: "unicode-bidi", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "unicode-bidi", value: prop' value })
instance Attr Switch_ UnicodeBidi  String  where
  attr UnicodeBidi value = unsafeAttribute $ This
    { key: "unicode-bidi", value: prop' value }
instance Attr Switch_ UnicodeBidi (Event.Event  String ) where
  attr UnicodeBidi eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "unicode-bidi", value: prop' value }

instance Attr everything UnicodeBidi (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr UnicodeBidi bothValues = unsafeAttribute $ Both
    { key: "unicode-bidi", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "unicode-bidi", value: unset' })
instance Attr everything UnicodeBidi  Unit  where
  attr UnicodeBidi _ = unsafeAttribute $ This
    { key: "unicode-bidi", value: unset' }
instance Attr everything UnicodeBidi (Event.Event  Unit ) where
  attr UnicodeBidi eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "unicode-bidi", value: unset' }