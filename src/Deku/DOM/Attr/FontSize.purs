module Deku.DOM.Attr.FontSize where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
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

data FontSize = FontSize

instance Attr FeBlend_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both (pure 
    { key: "font-size", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeBlend_ FontSize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontSize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-size", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeBlend_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr FeBlend_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeBlend_ FontSize (ST.ST Global.Global  String ) where
  attr FontSize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeColorMatrix_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both (pure 
    { key: "font-size", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeColorMatrix_ FontSize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontSize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-size", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeColorMatrix_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr FeColorMatrix_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeColorMatrix_ FontSize (ST.ST Global.Global  String ) where
  attr FontSize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeComponentTransfer_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both (pure 
    { key: "font-size", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeComponentTransfer_ FontSize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontSize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-size", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeComponentTransfer_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr FeComponentTransfer_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeComponentTransfer_ FontSize (ST.ST Global.Global  String ) where
  attr FontSize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeComposite_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both (pure 
    { key: "font-size", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeComposite_ FontSize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontSize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-size", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeComposite_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr FeComposite_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeComposite_ FontSize (ST.ST Global.Global  String ) where
  attr FontSize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeConvolveMatrix_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both (pure 
    { key: "font-size", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeConvolveMatrix_ FontSize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontSize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-size", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeConvolveMatrix_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr FeConvolveMatrix_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeConvolveMatrix_ FontSize (ST.ST Global.Global  String ) where
  attr FontSize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeDiffuseLighting_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both (pure 
    { key: "font-size", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeDiffuseLighting_ FontSize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontSize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-size", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeDiffuseLighting_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr FeDiffuseLighting_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeDiffuseLighting_ FontSize (ST.ST Global.Global  String ) where
  attr FontSize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeDisplacementMap_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both (pure 
    { key: "font-size", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeDisplacementMap_ FontSize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontSize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-size", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeDisplacementMap_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr FeDisplacementMap_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeDisplacementMap_ FontSize (ST.ST Global.Global  String ) where
  attr FontSize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeFlood_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both (pure 
    { key: "font-size", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeFlood_ FontSize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontSize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-size", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeFlood_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr FeFlood_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeFlood_ FontSize (ST.ST Global.Global  String ) where
  attr FontSize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeGaussianBlur_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both (pure 
    { key: "font-size", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeGaussianBlur_ FontSize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontSize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-size", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeGaussianBlur_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr FeGaussianBlur_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeGaussianBlur_ FontSize (ST.ST Global.Global  String ) where
  attr FontSize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeImage_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both (pure 
    { key: "font-size", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeImage_ FontSize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontSize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-size", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeImage_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr FeImage_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeImage_ FontSize (ST.ST Global.Global  String ) where
  attr FontSize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeMerge_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both (pure 
    { key: "font-size", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeMerge_ FontSize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontSize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-size", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeMerge_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr FeMerge_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeMerge_ FontSize (ST.ST Global.Global  String ) where
  attr FontSize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeMorphology_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both (pure 
    { key: "font-size", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeMorphology_ FontSize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontSize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-size", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeMorphology_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr FeMorphology_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeMorphology_ FontSize (ST.ST Global.Global  String ) where
  attr FontSize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeOffset_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both (pure 
    { key: "font-size", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeOffset_ FontSize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontSize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-size", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeOffset_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr FeOffset_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeOffset_ FontSize (ST.ST Global.Global  String ) where
  attr FontSize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeSpecularLighting_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both (pure 
    { key: "font-size", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeSpecularLighting_ FontSize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontSize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-size", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeSpecularLighting_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr FeSpecularLighting_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeSpecularLighting_ FontSize (ST.ST Global.Global  String ) where
  attr FontSize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeTile_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both (pure 
    { key: "font-size", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeTile_ FontSize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontSize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-size", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeTile_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr FeTile_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeTile_ FontSize (ST.ST Global.Global  String ) where
  attr FontSize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeTurbulence_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both (pure 
    { key: "font-size", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeTurbulence_ FontSize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontSize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-size", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr FeTurbulence_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr FeTurbulence_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr FeTurbulence_ FontSize (ST.ST Global.Global  String ) where
  attr FontSize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr Filter_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both (pure 
    { key: "font-size", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr Filter_ FontSize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontSize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-size", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr Filter_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr Filter_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr Filter_ FontSize (ST.ST Global.Global  String ) where
  attr FontSize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr Image_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both (pure 
    { key: "font-size", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr Image_ FontSize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontSize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-size", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr Image_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr Image_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr Image_ FontSize (ST.ST Global.Global  String ) where
  attr FontSize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr Switch_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both (pure 
    { key: "font-size", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr Switch_ FontSize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontSize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-size", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr Switch_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr Switch_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr Switch_ FontSize (ST.ST Global.Global  String ) where
  attr FontSize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr Text_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both (pure 
    { key: "font-size", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr Text_ FontSize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontSize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-size", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr Text_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr Text_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr Text_ FontSize (ST.ST Global.Global  String ) where
  attr FontSize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr Tspan_ FontSize (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontSize bothValues = unsafeAttribute $ Both (pure 
    { key: "font-size", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr Tspan_ FontSize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontSize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-size", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-size", value: prop' value })
instance Attr Tspan_ FontSize  String  where
  attr FontSize value = unsafeAttribute $ This $ pure $
    { key: "font-size", value: prop' value }
instance Attr Tspan_ FontSize (Event.Event  String ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr Tspan_ FontSize (ST.ST Global.Global  String ) where
  attr FontSize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-size", value: prop' value }

instance Attr everything FontSize (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr FontSize bothValues = unsafeAttribute $ Both (pure 
    { key: "font-size", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "font-size", value: unset' })
instance Attr everything FontSize (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr FontSize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "font-size", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "font-size", value: unset' })
instance Attr everything FontSize  Unit  where
  attr FontSize _ = unsafeAttribute $ This $ pure $
    { key: "font-size", value: unset' }
instance Attr everything FontSize (Event.Event  Unit ) where
  attr FontSize eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "font-size", value: unset' }

instance Attr everything FontSize (ST.ST Global.Global  Unit ) where
  attr FontSize stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "font-size", value: unset' }
