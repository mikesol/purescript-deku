module Deku.DOM.Attr.FloodOpacity where

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
import Deku.DOM.Elt.FeDropShadow (FeDropShadow_)
import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.DOM.Elt.FeComponentTransfer (FeComponentTransfer_)
import Deku.DOM.Elt.FeColorMatrix (FeColorMatrix_)
import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data FloodOpacity = FloodOpacity

instance Attr FeBlend_ FloodOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr FeBlend_ FloodOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FloodOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "flood-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr FeBlend_ FloodOpacity  String  where
  attr FloodOpacity value = unsafeAttribute $ This $ pure $
    { key: "flood-opacity", value: prop' value }
instance Attr FeBlend_ FloodOpacity (Event.Event  String ) where
  attr FloodOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr FeBlend_ FloodOpacity (ST.ST Global.Global  String ) where
  attr FloodOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr FeColorMatrix_ FloodOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr FeColorMatrix_ FloodOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FloodOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "flood-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr FeColorMatrix_ FloodOpacity  String  where
  attr FloodOpacity value = unsafeAttribute $ This $ pure $
    { key: "flood-opacity", value: prop' value }
instance Attr FeColorMatrix_ FloodOpacity (Event.Event  String ) where
  attr FloodOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr FeColorMatrix_ FloodOpacity (ST.ST Global.Global  String ) where
  attr FloodOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr FeComponentTransfer_ FloodOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr FeComponentTransfer_ FloodOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FloodOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "flood-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr FeComponentTransfer_ FloodOpacity  String  where
  attr FloodOpacity value = unsafeAttribute $ This $ pure $
    { key: "flood-opacity", value: prop' value }
instance Attr FeComponentTransfer_ FloodOpacity (Event.Event  String ) where
  attr FloodOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr FeComponentTransfer_ FloodOpacity (ST.ST Global.Global  String ) where
  attr FloodOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr FeComposite_ FloodOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr FeComposite_ FloodOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FloodOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "flood-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr FeComposite_ FloodOpacity  String  where
  attr FloodOpacity value = unsafeAttribute $ This $ pure $
    { key: "flood-opacity", value: prop' value }
instance Attr FeComposite_ FloodOpacity (Event.Event  String ) where
  attr FloodOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr FeComposite_ FloodOpacity (ST.ST Global.Global  String ) where
  attr FloodOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr FeConvolveMatrix_ FloodOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr FeConvolveMatrix_ FloodOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FloodOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "flood-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr FeConvolveMatrix_ FloodOpacity  String  where
  attr FloodOpacity value = unsafeAttribute $ This $ pure $
    { key: "flood-opacity", value: prop' value }
instance Attr FeConvolveMatrix_ FloodOpacity (Event.Event  String ) where
  attr FloodOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr FeConvolveMatrix_ FloodOpacity (ST.ST Global.Global  String ) where
  attr FloodOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr FeDiffuseLighting_ FloodOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr FeDiffuseLighting_ FloodOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FloodOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "flood-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr FeDiffuseLighting_ FloodOpacity  String  where
  attr FloodOpacity value = unsafeAttribute $ This $ pure $
    { key: "flood-opacity", value: prop' value }
instance Attr FeDiffuseLighting_ FloodOpacity (Event.Event  String ) where
  attr FloodOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr FeDiffuseLighting_ FloodOpacity (ST.ST Global.Global  String ) where
  attr FloodOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr FeDisplacementMap_ FloodOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr FeDisplacementMap_ FloodOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FloodOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "flood-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr FeDisplacementMap_ FloodOpacity  String  where
  attr FloodOpacity value = unsafeAttribute $ This $ pure $
    { key: "flood-opacity", value: prop' value }
instance Attr FeDisplacementMap_ FloodOpacity (Event.Event  String ) where
  attr FloodOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr FeDisplacementMap_ FloodOpacity (ST.ST Global.Global  String ) where
  attr FloodOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr FeDropShadow_ FloodOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr FeDropShadow_ FloodOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FloodOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "flood-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr FeDropShadow_ FloodOpacity  String  where
  attr FloodOpacity value = unsafeAttribute $ This $ pure $
    { key: "flood-opacity", value: prop' value }
instance Attr FeDropShadow_ FloodOpacity (Event.Event  String ) where
  attr FloodOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr FeDropShadow_ FloodOpacity (ST.ST Global.Global  String ) where
  attr FloodOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr FeFlood_ FloodOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr FeFlood_ FloodOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FloodOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "flood-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr FeFlood_ FloodOpacity  String  where
  attr FloodOpacity value = unsafeAttribute $ This $ pure $
    { key: "flood-opacity", value: prop' value }
instance Attr FeFlood_ FloodOpacity (Event.Event  String ) where
  attr FloodOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr FeFlood_ FloodOpacity (ST.ST Global.Global  String ) where
  attr FloodOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr FeGaussianBlur_ FloodOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr FeGaussianBlur_ FloodOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FloodOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "flood-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr FeGaussianBlur_ FloodOpacity  String  where
  attr FloodOpacity value = unsafeAttribute $ This $ pure $
    { key: "flood-opacity", value: prop' value }
instance Attr FeGaussianBlur_ FloodOpacity (Event.Event  String ) where
  attr FloodOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr FeGaussianBlur_ FloodOpacity (ST.ST Global.Global  String ) where
  attr FloodOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr FeImage_ FloodOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr FeImage_ FloodOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FloodOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "flood-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr FeImage_ FloodOpacity  String  where
  attr FloodOpacity value = unsafeAttribute $ This $ pure $
    { key: "flood-opacity", value: prop' value }
instance Attr FeImage_ FloodOpacity (Event.Event  String ) where
  attr FloodOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr FeImage_ FloodOpacity (ST.ST Global.Global  String ) where
  attr FloodOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr FeMerge_ FloodOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr FeMerge_ FloodOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FloodOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "flood-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr FeMerge_ FloodOpacity  String  where
  attr FloodOpacity value = unsafeAttribute $ This $ pure $
    { key: "flood-opacity", value: prop' value }
instance Attr FeMerge_ FloodOpacity (Event.Event  String ) where
  attr FloodOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr FeMerge_ FloodOpacity (ST.ST Global.Global  String ) where
  attr FloodOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr FeMorphology_ FloodOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr FeMorphology_ FloodOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FloodOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "flood-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr FeMorphology_ FloodOpacity  String  where
  attr FloodOpacity value = unsafeAttribute $ This $ pure $
    { key: "flood-opacity", value: prop' value }
instance Attr FeMorphology_ FloodOpacity (Event.Event  String ) where
  attr FloodOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr FeMorphology_ FloodOpacity (ST.ST Global.Global  String ) where
  attr FloodOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr FeOffset_ FloodOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr FeOffset_ FloodOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FloodOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "flood-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr FeOffset_ FloodOpacity  String  where
  attr FloodOpacity value = unsafeAttribute $ This $ pure $
    { key: "flood-opacity", value: prop' value }
instance Attr FeOffset_ FloodOpacity (Event.Event  String ) where
  attr FloodOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr FeOffset_ FloodOpacity (ST.ST Global.Global  String ) where
  attr FloodOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr FeSpecularLighting_ FloodOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr FeSpecularLighting_ FloodOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FloodOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "flood-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr FeSpecularLighting_ FloodOpacity  String  where
  attr FloodOpacity value = unsafeAttribute $ This $ pure $
    { key: "flood-opacity", value: prop' value }
instance Attr FeSpecularLighting_ FloodOpacity (Event.Event  String ) where
  attr FloodOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr FeSpecularLighting_ FloodOpacity (ST.ST Global.Global  String ) where
  attr FloodOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr FeTile_ FloodOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr FeTile_ FloodOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FloodOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "flood-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr FeTile_ FloodOpacity  String  where
  attr FloodOpacity value = unsafeAttribute $ This $ pure $
    { key: "flood-opacity", value: prop' value }
instance Attr FeTile_ FloodOpacity (Event.Event  String ) where
  attr FloodOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr FeTile_ FloodOpacity (ST.ST Global.Global  String ) where
  attr FloodOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr FeTurbulence_ FloodOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr FeTurbulence_ FloodOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FloodOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "flood-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr FeTurbulence_ FloodOpacity  String  where
  attr FloodOpacity value = unsafeAttribute $ This $ pure $
    { key: "flood-opacity", value: prop' value }
instance Attr FeTurbulence_ FloodOpacity (Event.Event  String ) where
  attr FloodOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr FeTurbulence_ FloodOpacity (ST.ST Global.Global  String ) where
  attr FloodOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr Filter_ FloodOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr Filter_ FloodOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FloodOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "flood-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr Filter_ FloodOpacity  String  where
  attr FloodOpacity value = unsafeAttribute $ This $ pure $
    { key: "flood-opacity", value: prop' value }
instance Attr Filter_ FloodOpacity (Event.Event  String ) where
  attr FloodOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr Filter_ FloodOpacity (ST.ST Global.Global  String ) where
  attr FloodOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr Image_ FloodOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr Image_ FloodOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FloodOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "flood-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr Image_ FloodOpacity  String  where
  attr FloodOpacity value = unsafeAttribute $ This $ pure $
    { key: "flood-opacity", value: prop' value }
instance Attr Image_ FloodOpacity (Event.Event  String ) where
  attr FloodOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr Image_ FloodOpacity (ST.ST Global.Global  String ) where
  attr FloodOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr Switch_ FloodOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr FloodOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr Switch_ FloodOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FloodOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "flood-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "flood-opacity", value: prop' value })
instance Attr Switch_ FloodOpacity  String  where
  attr FloodOpacity value = unsafeAttribute $ This $ pure $
    { key: "flood-opacity", value: prop' value }
instance Attr Switch_ FloodOpacity (Event.Event  String ) where
  attr FloodOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr Switch_ FloodOpacity (ST.ST Global.Global  String ) where
  attr FloodOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "flood-opacity", value: prop' value }

instance Attr everything FloodOpacity (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr FloodOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "flood-opacity", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "flood-opacity", value: unset' })
instance Attr everything FloodOpacity (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr FloodOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "flood-opacity", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "flood-opacity", value: unset' })
instance Attr everything FloodOpacity  Unit  where
  attr FloodOpacity _ = unsafeAttribute $ This $ pure $
    { key: "flood-opacity", value: unset' }
instance Attr everything FloodOpacity (Event.Event  Unit ) where
  attr FloodOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "flood-opacity", value: unset' }

instance Attr everything FloodOpacity (ST.ST Global.Global  Unit ) where
  attr FloodOpacity stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "flood-opacity", value: unset' }
