module Deku.DOM.Attr.Kerning where

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

data Kerning = Kerning

instance Attr FeBlend_ Kerning (NonEmpty.NonEmpty Event.Event  String ) where
  attr Kerning bothValues = unsafeAttribute $ Both (pure 
    { key: "kerning", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr FeBlend_ Kerning (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Kerning (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "kerning", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr FeBlend_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ This $ pure $
    { key: "kerning", value: prop' value }
instance Attr FeBlend_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr FeBlend_ Kerning (ST.ST Global.Global  String ) where
  attr Kerning stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr FeColorMatrix_ Kerning (NonEmpty.NonEmpty Event.Event  String ) where
  attr Kerning bothValues = unsafeAttribute $ Both (pure 
    { key: "kerning", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr FeColorMatrix_ Kerning (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Kerning (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "kerning", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr FeColorMatrix_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ This $ pure $
    { key: "kerning", value: prop' value }
instance Attr FeColorMatrix_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr FeColorMatrix_ Kerning (ST.ST Global.Global  String ) where
  attr Kerning stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr FeComponentTransfer_ Kerning (NonEmpty.NonEmpty Event.Event  String ) where
  attr Kerning bothValues = unsafeAttribute $ Both (pure 
    { key: "kerning", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr FeComponentTransfer_ Kerning (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Kerning (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "kerning", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr FeComponentTransfer_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ This $ pure $
    { key: "kerning", value: prop' value }
instance Attr FeComponentTransfer_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr FeComponentTransfer_ Kerning (ST.ST Global.Global  String ) where
  attr Kerning stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr FeComposite_ Kerning (NonEmpty.NonEmpty Event.Event  String ) where
  attr Kerning bothValues = unsafeAttribute $ Both (pure 
    { key: "kerning", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr FeComposite_ Kerning (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Kerning (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "kerning", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr FeComposite_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ This $ pure $
    { key: "kerning", value: prop' value }
instance Attr FeComposite_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr FeComposite_ Kerning (ST.ST Global.Global  String ) where
  attr Kerning stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr FeConvolveMatrix_ Kerning (NonEmpty.NonEmpty Event.Event  String ) where
  attr Kerning bothValues = unsafeAttribute $ Both (pure 
    { key: "kerning", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr FeConvolveMatrix_ Kerning (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Kerning (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "kerning", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr FeConvolveMatrix_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ This $ pure $
    { key: "kerning", value: prop' value }
instance Attr FeConvolveMatrix_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr FeConvolveMatrix_ Kerning (ST.ST Global.Global  String ) where
  attr Kerning stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr FeDiffuseLighting_ Kerning (NonEmpty.NonEmpty Event.Event  String ) where
  attr Kerning bothValues = unsafeAttribute $ Both (pure 
    { key: "kerning", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr FeDiffuseLighting_ Kerning (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Kerning (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "kerning", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr FeDiffuseLighting_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ This $ pure $
    { key: "kerning", value: prop' value }
instance Attr FeDiffuseLighting_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr FeDiffuseLighting_ Kerning (ST.ST Global.Global  String ) where
  attr Kerning stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr FeDisplacementMap_ Kerning (NonEmpty.NonEmpty Event.Event  String ) where
  attr Kerning bothValues = unsafeAttribute $ Both (pure 
    { key: "kerning", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr FeDisplacementMap_ Kerning (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Kerning (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "kerning", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr FeDisplacementMap_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ This $ pure $
    { key: "kerning", value: prop' value }
instance Attr FeDisplacementMap_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr FeDisplacementMap_ Kerning (ST.ST Global.Global  String ) where
  attr Kerning stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr FeFlood_ Kerning (NonEmpty.NonEmpty Event.Event  String ) where
  attr Kerning bothValues = unsafeAttribute $ Both (pure 
    { key: "kerning", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr FeFlood_ Kerning (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Kerning (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "kerning", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr FeFlood_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ This $ pure $
    { key: "kerning", value: prop' value }
instance Attr FeFlood_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr FeFlood_ Kerning (ST.ST Global.Global  String ) where
  attr Kerning stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr FeGaussianBlur_ Kerning (NonEmpty.NonEmpty Event.Event  String ) where
  attr Kerning bothValues = unsafeAttribute $ Both (pure 
    { key: "kerning", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr FeGaussianBlur_ Kerning (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Kerning (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "kerning", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr FeGaussianBlur_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ This $ pure $
    { key: "kerning", value: prop' value }
instance Attr FeGaussianBlur_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr FeGaussianBlur_ Kerning (ST.ST Global.Global  String ) where
  attr Kerning stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr FeImage_ Kerning (NonEmpty.NonEmpty Event.Event  String ) where
  attr Kerning bothValues = unsafeAttribute $ Both (pure 
    { key: "kerning", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr FeImage_ Kerning (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Kerning (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "kerning", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr FeImage_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ This $ pure $
    { key: "kerning", value: prop' value }
instance Attr FeImage_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr FeImage_ Kerning (ST.ST Global.Global  String ) where
  attr Kerning stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr FeMerge_ Kerning (NonEmpty.NonEmpty Event.Event  String ) where
  attr Kerning bothValues = unsafeAttribute $ Both (pure 
    { key: "kerning", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr FeMerge_ Kerning (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Kerning (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "kerning", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr FeMerge_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ This $ pure $
    { key: "kerning", value: prop' value }
instance Attr FeMerge_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr FeMerge_ Kerning (ST.ST Global.Global  String ) where
  attr Kerning stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr FeMorphology_ Kerning (NonEmpty.NonEmpty Event.Event  String ) where
  attr Kerning bothValues = unsafeAttribute $ Both (pure 
    { key: "kerning", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr FeMorphology_ Kerning (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Kerning (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "kerning", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr FeMorphology_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ This $ pure $
    { key: "kerning", value: prop' value }
instance Attr FeMorphology_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr FeMorphology_ Kerning (ST.ST Global.Global  String ) where
  attr Kerning stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr FeOffset_ Kerning (NonEmpty.NonEmpty Event.Event  String ) where
  attr Kerning bothValues = unsafeAttribute $ Both (pure 
    { key: "kerning", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr FeOffset_ Kerning (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Kerning (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "kerning", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr FeOffset_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ This $ pure $
    { key: "kerning", value: prop' value }
instance Attr FeOffset_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr FeOffset_ Kerning (ST.ST Global.Global  String ) where
  attr Kerning stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr FeSpecularLighting_ Kerning (NonEmpty.NonEmpty Event.Event  String ) where
  attr Kerning bothValues = unsafeAttribute $ Both (pure 
    { key: "kerning", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr FeSpecularLighting_ Kerning (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Kerning (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "kerning", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr FeSpecularLighting_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ This $ pure $
    { key: "kerning", value: prop' value }
instance Attr FeSpecularLighting_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr FeSpecularLighting_ Kerning (ST.ST Global.Global  String ) where
  attr Kerning stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr FeTile_ Kerning (NonEmpty.NonEmpty Event.Event  String ) where
  attr Kerning bothValues = unsafeAttribute $ Both (pure 
    { key: "kerning", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr FeTile_ Kerning (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Kerning (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "kerning", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr FeTile_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ This $ pure $
    { key: "kerning", value: prop' value }
instance Attr FeTile_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr FeTile_ Kerning (ST.ST Global.Global  String ) where
  attr Kerning stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr FeTurbulence_ Kerning (NonEmpty.NonEmpty Event.Event  String ) where
  attr Kerning bothValues = unsafeAttribute $ Both (pure 
    { key: "kerning", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr FeTurbulence_ Kerning (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Kerning (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "kerning", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr FeTurbulence_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ This $ pure $
    { key: "kerning", value: prop' value }
instance Attr FeTurbulence_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr FeTurbulence_ Kerning (ST.ST Global.Global  String ) where
  attr Kerning stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr Filter_ Kerning (NonEmpty.NonEmpty Event.Event  String ) where
  attr Kerning bothValues = unsafeAttribute $ Both (pure 
    { key: "kerning", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr Filter_ Kerning (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Kerning (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "kerning", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr Filter_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ This $ pure $
    { key: "kerning", value: prop' value }
instance Attr Filter_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr Filter_ Kerning (ST.ST Global.Global  String ) where
  attr Kerning stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr Image_ Kerning (NonEmpty.NonEmpty Event.Event  String ) where
  attr Kerning bothValues = unsafeAttribute $ Both (pure 
    { key: "kerning", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr Image_ Kerning (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Kerning (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "kerning", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr Image_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ This $ pure $
    { key: "kerning", value: prop' value }
instance Attr Image_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr Image_ Kerning (ST.ST Global.Global  String ) where
  attr Kerning stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr Switch_ Kerning (NonEmpty.NonEmpty Event.Event  String ) where
  attr Kerning bothValues = unsafeAttribute $ Both (pure 
    { key: "kerning", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr Switch_ Kerning (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Kerning (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "kerning", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "kerning", value: prop' value })
instance Attr Switch_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ This $ pure $
    { key: "kerning", value: prop' value }
instance Attr Switch_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr Switch_ Kerning (ST.ST Global.Global  String ) where
  attr Kerning stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "kerning", value: prop' value }

instance Attr everything Kerning (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Kerning bothValues = unsafeAttribute $ Both (pure 
    { key: "kerning", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "kerning", value: unset' })
instance Attr everything Kerning (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Kerning (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "kerning", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "kerning", value: unset' })
instance Attr everything Kerning  Unit  where
  attr Kerning _ = unsafeAttribute $ This $ pure $ { key: "kerning", value: unset' }
instance Attr everything Kerning (Event.Event  Unit ) where
  attr Kerning eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "kerning", value: unset' }

instance Attr everything Kerning (ST.ST Global.Global  Unit ) where
  attr Kerning stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "kerning", value: unset' }
