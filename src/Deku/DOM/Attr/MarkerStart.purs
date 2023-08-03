module Deku.DOM.Attr.MarkerStart where

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

data MarkerStart = MarkerStart

instance Attr FeBlend_ MarkerStart (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerStart bothValues = unsafeAttribute $ Both (pure 
    { key: "marker-start", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-start", value: prop' value })
instance Attr FeBlend_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute $ This $ pure $
    { key: "marker-start", value: prop' value }
instance Attr FeBlend_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-start", value: prop' value }

instance Attr FeColorMatrix_ MarkerStart (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerStart bothValues = unsafeAttribute $ Both (pure 
    { key: "marker-start", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-start", value: prop' value })
instance Attr FeColorMatrix_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute $ This $ pure $
    { key: "marker-start", value: prop' value }
instance Attr FeColorMatrix_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-start", value: prop' value }

instance Attr FeComponentTransfer_ MarkerStart (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerStart bothValues = unsafeAttribute $ Both (pure 
    { key: "marker-start", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-start", value: prop' value })
instance Attr FeComponentTransfer_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute $ This $ pure $
    { key: "marker-start", value: prop' value }
instance Attr FeComponentTransfer_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-start", value: prop' value }

instance Attr FeComposite_ MarkerStart (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerStart bothValues = unsafeAttribute $ Both (pure 
    { key: "marker-start", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-start", value: prop' value })
instance Attr FeComposite_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute $ This $ pure $
    { key: "marker-start", value: prop' value }
instance Attr FeComposite_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-start", value: prop' value }

instance Attr FeConvolveMatrix_ MarkerStart (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerStart bothValues = unsafeAttribute $ Both (pure 
    { key: "marker-start", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-start", value: prop' value })
instance Attr FeConvolveMatrix_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute $ This $ pure $
    { key: "marker-start", value: prop' value }
instance Attr FeConvolveMatrix_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-start", value: prop' value }

instance Attr FeDiffuseLighting_ MarkerStart (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerStart bothValues = unsafeAttribute $ Both (pure 
    { key: "marker-start", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-start", value: prop' value })
instance Attr FeDiffuseLighting_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute $ This $ pure $
    { key: "marker-start", value: prop' value }
instance Attr FeDiffuseLighting_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-start", value: prop' value }

instance Attr FeDisplacementMap_ MarkerStart (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerStart bothValues = unsafeAttribute $ Both (pure 
    { key: "marker-start", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-start", value: prop' value })
instance Attr FeDisplacementMap_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute $ This $ pure $
    { key: "marker-start", value: prop' value }
instance Attr FeDisplacementMap_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-start", value: prop' value }

instance Attr FeFlood_ MarkerStart (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerStart bothValues = unsafeAttribute $ Both (pure 
    { key: "marker-start", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-start", value: prop' value })
instance Attr FeFlood_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute $ This $ pure $
    { key: "marker-start", value: prop' value }
instance Attr FeFlood_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-start", value: prop' value }

instance Attr FeGaussianBlur_ MarkerStart (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerStart bothValues = unsafeAttribute $ Both (pure 
    { key: "marker-start", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-start", value: prop' value })
instance Attr FeGaussianBlur_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute $ This $ pure $
    { key: "marker-start", value: prop' value }
instance Attr FeGaussianBlur_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-start", value: prop' value }

instance Attr FeImage_ MarkerStart (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerStart bothValues = unsafeAttribute $ Both (pure 
    { key: "marker-start", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-start", value: prop' value })
instance Attr FeImage_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute $ This $ pure $
    { key: "marker-start", value: prop' value }
instance Attr FeImage_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-start", value: prop' value }

instance Attr FeMerge_ MarkerStart (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerStart bothValues = unsafeAttribute $ Both (pure 
    { key: "marker-start", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-start", value: prop' value })
instance Attr FeMerge_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute $ This $ pure $
    { key: "marker-start", value: prop' value }
instance Attr FeMerge_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-start", value: prop' value }

instance Attr FeMorphology_ MarkerStart (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerStart bothValues = unsafeAttribute $ Both (pure 
    { key: "marker-start", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-start", value: prop' value })
instance Attr FeMorphology_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute $ This $ pure $
    { key: "marker-start", value: prop' value }
instance Attr FeMorphology_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-start", value: prop' value }

instance Attr FeOffset_ MarkerStart (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerStart bothValues = unsafeAttribute $ Both (pure 
    { key: "marker-start", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-start", value: prop' value })
instance Attr FeOffset_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute $ This $ pure $
    { key: "marker-start", value: prop' value }
instance Attr FeOffset_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-start", value: prop' value }

instance Attr FeSpecularLighting_ MarkerStart (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerStart bothValues = unsafeAttribute $ Both (pure 
    { key: "marker-start", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-start", value: prop' value })
instance Attr FeSpecularLighting_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute $ This $ pure $
    { key: "marker-start", value: prop' value }
instance Attr FeSpecularLighting_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-start", value: prop' value }

instance Attr FeTile_ MarkerStart (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerStart bothValues = unsafeAttribute $ Both (pure 
    { key: "marker-start", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-start", value: prop' value })
instance Attr FeTile_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute $ This $ pure $
    { key: "marker-start", value: prop' value }
instance Attr FeTile_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-start", value: prop' value }

instance Attr FeTurbulence_ MarkerStart (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerStart bothValues = unsafeAttribute $ Both (pure 
    { key: "marker-start", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-start", value: prop' value })
instance Attr FeTurbulence_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute $ This $ pure $
    { key: "marker-start", value: prop' value }
instance Attr FeTurbulence_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-start", value: prop' value }

instance Attr Filter_ MarkerStart (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerStart bothValues = unsafeAttribute $ Both (pure 
    { key: "marker-start", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-start", value: prop' value })
instance Attr Filter_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute $ This $ pure $
    { key: "marker-start", value: prop' value }
instance Attr Filter_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-start", value: prop' value }

instance Attr Image_ MarkerStart (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerStart bothValues = unsafeAttribute $ Both (pure 
    { key: "marker-start", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-start", value: prop' value })
instance Attr Image_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute $ This $ pure $
    { key: "marker-start", value: prop' value }
instance Attr Image_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-start", value: prop' value }

instance Attr Switch_ MarkerStart (NonEmpty.NonEmpty Event.Event  String ) where
  attr MarkerStart bothValues = unsafeAttribute $ Both (pure 
    { key: "marker-start", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "marker-start", value: prop' value })
instance Attr Switch_ MarkerStart  String  where
  attr MarkerStart value = unsafeAttribute $ This $ pure $
    { key: "marker-start", value: prop' value }
instance Attr Switch_ MarkerStart (Event.Event  String ) where
  attr MarkerStart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "marker-start", value: prop' value }

instance Attr everything MarkerStart (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr MarkerStart bothValues = unsafeAttribute $ Both (pure 
    { key: "marker-start", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "marker-start", value: unset' })
instance Attr everything MarkerStart  Unit  where
  attr MarkerStart _ = unsafeAttribute $ This $ pure $
    { key: "marker-start", value: unset' }
instance Attr everything MarkerStart (Event.Event  Unit ) where
  attr MarkerStart eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "marker-start", value: unset' }
