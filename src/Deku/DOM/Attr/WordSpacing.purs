module Deku.DOM.Attr.WordSpacing where

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

data WordSpacing = WordSpacing

instance Attr FeBlend_ WordSpacing (NonEmpty.NonEmpty Event.Event  String ) where
  attr WordSpacing bothValues = unsafeAttribute $ Both (pure 
    { key: "word-spacing", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr FeBlend_ WordSpacing (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr WordSpacing (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "word-spacing", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr FeBlend_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute $ This $ pure $
    { key: "word-spacing", value: prop' value }
instance Attr FeBlend_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr FeBlend_ WordSpacing (ST.ST Global.Global  String ) where
  attr WordSpacing stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr FeColorMatrix_ WordSpacing (NonEmpty.NonEmpty Event.Event  String ) where
  attr WordSpacing bothValues = unsafeAttribute $ Both (pure 
    { key: "word-spacing", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr FeColorMatrix_ WordSpacing (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr WordSpacing (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "word-spacing", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr FeColorMatrix_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute $ This $ pure $
    { key: "word-spacing", value: prop' value }
instance Attr FeColorMatrix_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr FeColorMatrix_ WordSpacing (ST.ST Global.Global  String ) where
  attr WordSpacing stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr FeComponentTransfer_ WordSpacing (NonEmpty.NonEmpty Event.Event  String ) where
  attr WordSpacing bothValues = unsafeAttribute $ Both (pure 
    { key: "word-spacing", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr FeComponentTransfer_ WordSpacing (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr WordSpacing (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "word-spacing", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr FeComponentTransfer_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute $ This $ pure $
    { key: "word-spacing", value: prop' value }
instance Attr FeComponentTransfer_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr FeComponentTransfer_ WordSpacing (ST.ST Global.Global  String ) where
  attr WordSpacing stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr FeComposite_ WordSpacing (NonEmpty.NonEmpty Event.Event  String ) where
  attr WordSpacing bothValues = unsafeAttribute $ Both (pure 
    { key: "word-spacing", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr FeComposite_ WordSpacing (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr WordSpacing (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "word-spacing", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr FeComposite_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute $ This $ pure $
    { key: "word-spacing", value: prop' value }
instance Attr FeComposite_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr FeComposite_ WordSpacing (ST.ST Global.Global  String ) where
  attr WordSpacing stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr FeConvolveMatrix_ WordSpacing (NonEmpty.NonEmpty Event.Event  String ) where
  attr WordSpacing bothValues = unsafeAttribute $ Both (pure 
    { key: "word-spacing", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr FeConvolveMatrix_ WordSpacing (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr WordSpacing (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "word-spacing", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr FeConvolveMatrix_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute $ This $ pure $
    { key: "word-spacing", value: prop' value }
instance Attr FeConvolveMatrix_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr FeConvolveMatrix_ WordSpacing (ST.ST Global.Global  String ) where
  attr WordSpacing stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr FeDiffuseLighting_ WordSpacing (NonEmpty.NonEmpty Event.Event  String ) where
  attr WordSpacing bothValues = unsafeAttribute $ Both (pure 
    { key: "word-spacing", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr FeDiffuseLighting_ WordSpacing (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr WordSpacing (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "word-spacing", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr FeDiffuseLighting_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute $ This $ pure $
    { key: "word-spacing", value: prop' value }
instance Attr FeDiffuseLighting_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr FeDiffuseLighting_ WordSpacing (ST.ST Global.Global  String ) where
  attr WordSpacing stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr FeDisplacementMap_ WordSpacing (NonEmpty.NonEmpty Event.Event  String ) where
  attr WordSpacing bothValues = unsafeAttribute $ Both (pure 
    { key: "word-spacing", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr FeDisplacementMap_ WordSpacing (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr WordSpacing (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "word-spacing", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr FeDisplacementMap_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute $ This $ pure $
    { key: "word-spacing", value: prop' value }
instance Attr FeDisplacementMap_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr FeDisplacementMap_ WordSpacing (ST.ST Global.Global  String ) where
  attr WordSpacing stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr FeFlood_ WordSpacing (NonEmpty.NonEmpty Event.Event  String ) where
  attr WordSpacing bothValues = unsafeAttribute $ Both (pure 
    { key: "word-spacing", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr FeFlood_ WordSpacing (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr WordSpacing (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "word-spacing", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr FeFlood_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute $ This $ pure $
    { key: "word-spacing", value: prop' value }
instance Attr FeFlood_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr FeFlood_ WordSpacing (ST.ST Global.Global  String ) where
  attr WordSpacing stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr FeGaussianBlur_ WordSpacing (NonEmpty.NonEmpty Event.Event  String ) where
  attr WordSpacing bothValues = unsafeAttribute $ Both (pure 
    { key: "word-spacing", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr FeGaussianBlur_ WordSpacing (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr WordSpacing (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "word-spacing", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr FeGaussianBlur_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute $ This $ pure $
    { key: "word-spacing", value: prop' value }
instance Attr FeGaussianBlur_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr FeGaussianBlur_ WordSpacing (ST.ST Global.Global  String ) where
  attr WordSpacing stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr FeImage_ WordSpacing (NonEmpty.NonEmpty Event.Event  String ) where
  attr WordSpacing bothValues = unsafeAttribute $ Both (pure 
    { key: "word-spacing", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr FeImage_ WordSpacing (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr WordSpacing (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "word-spacing", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr FeImage_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute $ This $ pure $
    { key: "word-spacing", value: prop' value }
instance Attr FeImage_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr FeImage_ WordSpacing (ST.ST Global.Global  String ) where
  attr WordSpacing stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr FeMerge_ WordSpacing (NonEmpty.NonEmpty Event.Event  String ) where
  attr WordSpacing bothValues = unsafeAttribute $ Both (pure 
    { key: "word-spacing", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr FeMerge_ WordSpacing (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr WordSpacing (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "word-spacing", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr FeMerge_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute $ This $ pure $
    { key: "word-spacing", value: prop' value }
instance Attr FeMerge_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr FeMerge_ WordSpacing (ST.ST Global.Global  String ) where
  attr WordSpacing stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr FeMorphology_ WordSpacing (NonEmpty.NonEmpty Event.Event  String ) where
  attr WordSpacing bothValues = unsafeAttribute $ Both (pure 
    { key: "word-spacing", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr FeMorphology_ WordSpacing (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr WordSpacing (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "word-spacing", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr FeMorphology_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute $ This $ pure $
    { key: "word-spacing", value: prop' value }
instance Attr FeMorphology_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr FeMorphology_ WordSpacing (ST.ST Global.Global  String ) where
  attr WordSpacing stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr FeOffset_ WordSpacing (NonEmpty.NonEmpty Event.Event  String ) where
  attr WordSpacing bothValues = unsafeAttribute $ Both (pure 
    { key: "word-spacing", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr FeOffset_ WordSpacing (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr WordSpacing (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "word-spacing", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr FeOffset_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute $ This $ pure $
    { key: "word-spacing", value: prop' value }
instance Attr FeOffset_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr FeOffset_ WordSpacing (ST.ST Global.Global  String ) where
  attr WordSpacing stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr FeSpecularLighting_ WordSpacing (NonEmpty.NonEmpty Event.Event  String ) where
  attr WordSpacing bothValues = unsafeAttribute $ Both (pure 
    { key: "word-spacing", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr FeSpecularLighting_ WordSpacing (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr WordSpacing (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "word-spacing", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr FeSpecularLighting_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute $ This $ pure $
    { key: "word-spacing", value: prop' value }
instance Attr FeSpecularLighting_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr FeSpecularLighting_ WordSpacing (ST.ST Global.Global  String ) where
  attr WordSpacing stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr FeTile_ WordSpacing (NonEmpty.NonEmpty Event.Event  String ) where
  attr WordSpacing bothValues = unsafeAttribute $ Both (pure 
    { key: "word-spacing", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr FeTile_ WordSpacing (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr WordSpacing (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "word-spacing", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr FeTile_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute $ This $ pure $
    { key: "word-spacing", value: prop' value }
instance Attr FeTile_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr FeTile_ WordSpacing (ST.ST Global.Global  String ) where
  attr WordSpacing stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr FeTurbulence_ WordSpacing (NonEmpty.NonEmpty Event.Event  String ) where
  attr WordSpacing bothValues = unsafeAttribute $ Both (pure 
    { key: "word-spacing", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr FeTurbulence_ WordSpacing (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr WordSpacing (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "word-spacing", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr FeTurbulence_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute $ This $ pure $
    { key: "word-spacing", value: prop' value }
instance Attr FeTurbulence_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr FeTurbulence_ WordSpacing (ST.ST Global.Global  String ) where
  attr WordSpacing stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr Filter_ WordSpacing (NonEmpty.NonEmpty Event.Event  String ) where
  attr WordSpacing bothValues = unsafeAttribute $ Both (pure 
    { key: "word-spacing", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr Filter_ WordSpacing (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr WordSpacing (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "word-spacing", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr Filter_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute $ This $ pure $
    { key: "word-spacing", value: prop' value }
instance Attr Filter_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr Filter_ WordSpacing (ST.ST Global.Global  String ) where
  attr WordSpacing stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr Image_ WordSpacing (NonEmpty.NonEmpty Event.Event  String ) where
  attr WordSpacing bothValues = unsafeAttribute $ Both (pure 
    { key: "word-spacing", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr Image_ WordSpacing (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr WordSpacing (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "word-spacing", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr Image_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute $ This $ pure $
    { key: "word-spacing", value: prop' value }
instance Attr Image_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr Image_ WordSpacing (ST.ST Global.Global  String ) where
  attr WordSpacing stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr Switch_ WordSpacing (NonEmpty.NonEmpty Event.Event  String ) where
  attr WordSpacing bothValues = unsafeAttribute $ Both (pure 
    { key: "word-spacing", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr Switch_ WordSpacing (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr WordSpacing (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "word-spacing", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "word-spacing", value: prop' value })
instance Attr Switch_ WordSpacing  String  where
  attr WordSpacing value = unsafeAttribute $ This $ pure $
    { key: "word-spacing", value: prop' value }
instance Attr Switch_ WordSpacing (Event.Event  String ) where
  attr WordSpacing eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr Switch_ WordSpacing (ST.ST Global.Global  String ) where
  attr WordSpacing stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "word-spacing", value: prop' value }

instance Attr everything WordSpacing (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr WordSpacing bothValues = unsafeAttribute $ Both (pure 
    { key: "word-spacing", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "word-spacing", value: unset' })
instance Attr everything WordSpacing (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr WordSpacing (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "word-spacing", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "word-spacing", value: unset' })
instance Attr everything WordSpacing  Unit  where
  attr WordSpacing _ = unsafeAttribute $ This $ pure $
    { key: "word-spacing", value: unset' }
instance Attr everything WordSpacing (Event.Event  Unit ) where
  attr WordSpacing eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "word-spacing", value: unset' }

instance Attr everything WordSpacing (ST.ST Global.Global  Unit ) where
  attr WordSpacing stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "word-spacing", value: unset' }
