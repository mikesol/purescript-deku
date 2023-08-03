module Deku.DOM.Attr.ColorProfile where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
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

data ColorProfile = ColorProfile

instance Attr FeBlend_ ColorProfile (NonEmpty.NonEmpty Event.Event  String ) where
  attr ColorProfile bothValues = unsafeAttribute $ Both (pure 
    { key: "color-profile", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr FeBlend_ ColorProfile (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr ColorProfile (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color-profile", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr FeBlend_ ColorProfile  String  where
  attr ColorProfile value = unsafeAttribute $ This $ pure $
    { key: "color-profile", value: prop' value }
instance Attr FeBlend_ ColorProfile (Event.Event  String ) where
  attr ColorProfile eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr FeBlend_ ColorProfile (ST.ST Global.Global  String ) where
  attr ColorProfile stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr FeColorMatrix_ ColorProfile (NonEmpty.NonEmpty Event.Event  String ) where
  attr ColorProfile bothValues = unsafeAttribute $ Both (pure 
    { key: "color-profile", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr FeColorMatrix_ ColorProfile (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr ColorProfile (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color-profile", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr FeColorMatrix_ ColorProfile  String  where
  attr ColorProfile value = unsafeAttribute $ This $ pure $
    { key: "color-profile", value: prop' value }
instance Attr FeColorMatrix_ ColorProfile (Event.Event  String ) where
  attr ColorProfile eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr FeColorMatrix_ ColorProfile (ST.ST Global.Global  String ) where
  attr ColorProfile stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr FeComponentTransfer_ ColorProfile (NonEmpty.NonEmpty Event.Event  String ) where
  attr ColorProfile bothValues = unsafeAttribute $ Both (pure 
    { key: "color-profile", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr FeComponentTransfer_ ColorProfile (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr ColorProfile (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color-profile", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr FeComponentTransfer_ ColorProfile  String  where
  attr ColorProfile value = unsafeAttribute $ This $ pure $
    { key: "color-profile", value: prop' value }
instance Attr FeComponentTransfer_ ColorProfile (Event.Event  String ) where
  attr ColorProfile eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr FeComponentTransfer_ ColorProfile (ST.ST Global.Global  String ) where
  attr ColorProfile stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr FeComposite_ ColorProfile (NonEmpty.NonEmpty Event.Event  String ) where
  attr ColorProfile bothValues = unsafeAttribute $ Both (pure 
    { key: "color-profile", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr FeComposite_ ColorProfile (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr ColorProfile (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color-profile", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr FeComposite_ ColorProfile  String  where
  attr ColorProfile value = unsafeAttribute $ This $ pure $
    { key: "color-profile", value: prop' value }
instance Attr FeComposite_ ColorProfile (Event.Event  String ) where
  attr ColorProfile eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr FeComposite_ ColorProfile (ST.ST Global.Global  String ) where
  attr ColorProfile stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr FeConvolveMatrix_ ColorProfile (NonEmpty.NonEmpty Event.Event  String ) where
  attr ColorProfile bothValues = unsafeAttribute $ Both (pure 
    { key: "color-profile", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr FeConvolveMatrix_ ColorProfile (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr ColorProfile (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color-profile", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr FeConvolveMatrix_ ColorProfile  String  where
  attr ColorProfile value = unsafeAttribute $ This $ pure $
    { key: "color-profile", value: prop' value }
instance Attr FeConvolveMatrix_ ColorProfile (Event.Event  String ) where
  attr ColorProfile eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr FeConvolveMatrix_ ColorProfile (ST.ST Global.Global  String ) where
  attr ColorProfile stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr FeDiffuseLighting_ ColorProfile (NonEmpty.NonEmpty Event.Event  String ) where
  attr ColorProfile bothValues = unsafeAttribute $ Both (pure 
    { key: "color-profile", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr FeDiffuseLighting_ ColorProfile (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr ColorProfile (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color-profile", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr FeDiffuseLighting_ ColorProfile  String  where
  attr ColorProfile value = unsafeAttribute $ This $ pure $
    { key: "color-profile", value: prop' value }
instance Attr FeDiffuseLighting_ ColorProfile (Event.Event  String ) where
  attr ColorProfile eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr FeDiffuseLighting_ ColorProfile (ST.ST Global.Global  String ) where
  attr ColorProfile stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr FeDisplacementMap_ ColorProfile (NonEmpty.NonEmpty Event.Event  String ) where
  attr ColorProfile bothValues = unsafeAttribute $ Both (pure 
    { key: "color-profile", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr FeDisplacementMap_ ColorProfile (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr ColorProfile (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color-profile", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr FeDisplacementMap_ ColorProfile  String  where
  attr ColorProfile value = unsafeAttribute $ This $ pure $
    { key: "color-profile", value: prop' value }
instance Attr FeDisplacementMap_ ColorProfile (Event.Event  String ) where
  attr ColorProfile eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr FeDisplacementMap_ ColorProfile (ST.ST Global.Global  String ) where
  attr ColorProfile stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr FeFlood_ ColorProfile (NonEmpty.NonEmpty Event.Event  String ) where
  attr ColorProfile bothValues = unsafeAttribute $ Both (pure 
    { key: "color-profile", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr FeFlood_ ColorProfile (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr ColorProfile (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color-profile", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr FeFlood_ ColorProfile  String  where
  attr ColorProfile value = unsafeAttribute $ This $ pure $
    { key: "color-profile", value: prop' value }
instance Attr FeFlood_ ColorProfile (Event.Event  String ) where
  attr ColorProfile eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr FeFlood_ ColorProfile (ST.ST Global.Global  String ) where
  attr ColorProfile stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr FeGaussianBlur_ ColorProfile (NonEmpty.NonEmpty Event.Event  String ) where
  attr ColorProfile bothValues = unsafeAttribute $ Both (pure 
    { key: "color-profile", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr FeGaussianBlur_ ColorProfile (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr ColorProfile (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color-profile", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr FeGaussianBlur_ ColorProfile  String  where
  attr ColorProfile value = unsafeAttribute $ This $ pure $
    { key: "color-profile", value: prop' value }
instance Attr FeGaussianBlur_ ColorProfile (Event.Event  String ) where
  attr ColorProfile eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr FeGaussianBlur_ ColorProfile (ST.ST Global.Global  String ) where
  attr ColorProfile stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr FeImage_ ColorProfile (NonEmpty.NonEmpty Event.Event  String ) where
  attr ColorProfile bothValues = unsafeAttribute $ Both (pure 
    { key: "color-profile", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr FeImage_ ColorProfile (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr ColorProfile (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color-profile", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr FeImage_ ColorProfile  String  where
  attr ColorProfile value = unsafeAttribute $ This $ pure $
    { key: "color-profile", value: prop' value }
instance Attr FeImage_ ColorProfile (Event.Event  String ) where
  attr ColorProfile eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr FeImage_ ColorProfile (ST.ST Global.Global  String ) where
  attr ColorProfile stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr FeMerge_ ColorProfile (NonEmpty.NonEmpty Event.Event  String ) where
  attr ColorProfile bothValues = unsafeAttribute $ Both (pure 
    { key: "color-profile", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr FeMerge_ ColorProfile (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr ColorProfile (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color-profile", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr FeMerge_ ColorProfile  String  where
  attr ColorProfile value = unsafeAttribute $ This $ pure $
    { key: "color-profile", value: prop' value }
instance Attr FeMerge_ ColorProfile (Event.Event  String ) where
  attr ColorProfile eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr FeMerge_ ColorProfile (ST.ST Global.Global  String ) where
  attr ColorProfile stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr FeMorphology_ ColorProfile (NonEmpty.NonEmpty Event.Event  String ) where
  attr ColorProfile bothValues = unsafeAttribute $ Both (pure 
    { key: "color-profile", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr FeMorphology_ ColorProfile (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr ColorProfile (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color-profile", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr FeMorphology_ ColorProfile  String  where
  attr ColorProfile value = unsafeAttribute $ This $ pure $
    { key: "color-profile", value: prop' value }
instance Attr FeMorphology_ ColorProfile (Event.Event  String ) where
  attr ColorProfile eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr FeMorphology_ ColorProfile (ST.ST Global.Global  String ) where
  attr ColorProfile stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr FeOffset_ ColorProfile (NonEmpty.NonEmpty Event.Event  String ) where
  attr ColorProfile bothValues = unsafeAttribute $ Both (pure 
    { key: "color-profile", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr FeOffset_ ColorProfile (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr ColorProfile (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color-profile", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr FeOffset_ ColorProfile  String  where
  attr ColorProfile value = unsafeAttribute $ This $ pure $
    { key: "color-profile", value: prop' value }
instance Attr FeOffset_ ColorProfile (Event.Event  String ) where
  attr ColorProfile eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr FeOffset_ ColorProfile (ST.ST Global.Global  String ) where
  attr ColorProfile stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr FeSpecularLighting_ ColorProfile (NonEmpty.NonEmpty Event.Event  String ) where
  attr ColorProfile bothValues = unsafeAttribute $ Both (pure 
    { key: "color-profile", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr FeSpecularLighting_ ColorProfile (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr ColorProfile (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color-profile", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr FeSpecularLighting_ ColorProfile  String  where
  attr ColorProfile value = unsafeAttribute $ This $ pure $
    { key: "color-profile", value: prop' value }
instance Attr FeSpecularLighting_ ColorProfile (Event.Event  String ) where
  attr ColorProfile eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr FeSpecularLighting_ ColorProfile (ST.ST Global.Global  String ) where
  attr ColorProfile stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr FeTile_ ColorProfile (NonEmpty.NonEmpty Event.Event  String ) where
  attr ColorProfile bothValues = unsafeAttribute $ Both (pure 
    { key: "color-profile", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr FeTile_ ColorProfile (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr ColorProfile (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color-profile", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr FeTile_ ColorProfile  String  where
  attr ColorProfile value = unsafeAttribute $ This $ pure $
    { key: "color-profile", value: prop' value }
instance Attr FeTile_ ColorProfile (Event.Event  String ) where
  attr ColorProfile eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr FeTile_ ColorProfile (ST.ST Global.Global  String ) where
  attr ColorProfile stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr FeTurbulence_ ColorProfile (NonEmpty.NonEmpty Event.Event  String ) where
  attr ColorProfile bothValues = unsafeAttribute $ Both (pure 
    { key: "color-profile", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr FeTurbulence_ ColorProfile (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr ColorProfile (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color-profile", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr FeTurbulence_ ColorProfile  String  where
  attr ColorProfile value = unsafeAttribute $ This $ pure $
    { key: "color-profile", value: prop' value }
instance Attr FeTurbulence_ ColorProfile (Event.Event  String ) where
  attr ColorProfile eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr FeTurbulence_ ColorProfile (ST.ST Global.Global  String ) where
  attr ColorProfile stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr Filter_ ColorProfile (NonEmpty.NonEmpty Event.Event  String ) where
  attr ColorProfile bothValues = unsafeAttribute $ Both (pure 
    { key: "color-profile", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr Filter_ ColorProfile (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr ColorProfile (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color-profile", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr Filter_ ColorProfile  String  where
  attr ColorProfile value = unsafeAttribute $ This $ pure $
    { key: "color-profile", value: prop' value }
instance Attr Filter_ ColorProfile (Event.Event  String ) where
  attr ColorProfile eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr Filter_ ColorProfile (ST.ST Global.Global  String ) where
  attr ColorProfile stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr Image_ ColorProfile (NonEmpty.NonEmpty Event.Event  String ) where
  attr ColorProfile bothValues = unsafeAttribute $ Both (pure 
    { key: "color-profile", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr Image_ ColorProfile (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr ColorProfile (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color-profile", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr Image_ ColorProfile  String  where
  attr ColorProfile value = unsafeAttribute $ This $ pure $
    { key: "color-profile", value: prop' value }
instance Attr Image_ ColorProfile (Event.Event  String ) where
  attr ColorProfile eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr Image_ ColorProfile (ST.ST Global.Global  String ) where
  attr ColorProfile stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr Switch_ ColorProfile (NonEmpty.NonEmpty Event.Event  String ) where
  attr ColorProfile bothValues = unsafeAttribute $ Both (pure 
    { key: "color-profile", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr Switch_ ColorProfile (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr ColorProfile (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "color-profile", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "color-profile", value: prop' value })
instance Attr Switch_ ColorProfile  String  where
  attr ColorProfile value = unsafeAttribute $ This $ pure $
    { key: "color-profile", value: prop' value }
instance Attr Switch_ ColorProfile (Event.Event  String ) where
  attr ColorProfile eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr Switch_ ColorProfile (ST.ST Global.Global  String ) where
  attr ColorProfile stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "color-profile", value: prop' value }

instance Attr everything ColorProfile (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr ColorProfile bothValues = unsafeAttribute $ Both (pure 
    { key: "color-profile", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "color-profile", value: unset' })
instance Attr everything ColorProfile (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr ColorProfile (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "color-profile", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "color-profile", value: unset' })
instance Attr everything ColorProfile  Unit  where
  attr ColorProfile _ = unsafeAttribute $ This $ pure $
    { key: "color-profile", value: unset' }
instance Attr everything ColorProfile (Event.Event  Unit ) where
  attr ColorProfile eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "color-profile", value: unset' }

instance Attr everything ColorProfile (ST.ST Global.Global  Unit ) where
  attr ColorProfile stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "color-profile", value: unset' }
