module Deku.DOM.Attr.DominantBaseline where

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

data DominantBaseline = DominantBaseline

instance Attr FeBlend_ DominantBaseline (NonEmpty.NonEmpty Event.Event  String ) where
  attr DominantBaseline bothValues = unsafeAttribute $ Both (pure 
    { key: "dominant-baseline", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr FeBlend_ DominantBaseline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr DominantBaseline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "dominant-baseline", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr FeBlend_ DominantBaseline  String  where
  attr DominantBaseline value = unsafeAttribute $ This $ pure $
    { key: "dominant-baseline", value: prop' value }
instance Attr FeBlend_ DominantBaseline (Event.Event  String ) where
  attr DominantBaseline eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr FeBlend_ DominantBaseline (ST.ST Global.Global  String ) where
  attr DominantBaseline stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr FeColorMatrix_ DominantBaseline (NonEmpty.NonEmpty Event.Event  String ) where
  attr DominantBaseline bothValues = unsafeAttribute $ Both (pure 
    { key: "dominant-baseline", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr FeColorMatrix_ DominantBaseline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr DominantBaseline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "dominant-baseline", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr FeColorMatrix_ DominantBaseline  String  where
  attr DominantBaseline value = unsafeAttribute $ This $ pure $
    { key: "dominant-baseline", value: prop' value }
instance Attr FeColorMatrix_ DominantBaseline (Event.Event  String ) where
  attr DominantBaseline eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr FeColorMatrix_ DominantBaseline (ST.ST Global.Global  String ) where
  attr DominantBaseline stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr FeComponentTransfer_ DominantBaseline (NonEmpty.NonEmpty Event.Event  String ) where
  attr DominantBaseline bothValues = unsafeAttribute $ Both (pure 
    { key: "dominant-baseline", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr FeComponentTransfer_ DominantBaseline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr DominantBaseline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "dominant-baseline", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr FeComponentTransfer_ DominantBaseline  String  where
  attr DominantBaseline value = unsafeAttribute $ This $ pure $
    { key: "dominant-baseline", value: prop' value }
instance Attr FeComponentTransfer_ DominantBaseline (Event.Event  String ) where
  attr DominantBaseline eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr FeComponentTransfer_ DominantBaseline (ST.ST Global.Global  String ) where
  attr DominantBaseline stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr FeComposite_ DominantBaseline (NonEmpty.NonEmpty Event.Event  String ) where
  attr DominantBaseline bothValues = unsafeAttribute $ Both (pure 
    { key: "dominant-baseline", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr FeComposite_ DominantBaseline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr DominantBaseline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "dominant-baseline", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr FeComposite_ DominantBaseline  String  where
  attr DominantBaseline value = unsafeAttribute $ This $ pure $
    { key: "dominant-baseline", value: prop' value }
instance Attr FeComposite_ DominantBaseline (Event.Event  String ) where
  attr DominantBaseline eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr FeComposite_ DominantBaseline (ST.ST Global.Global  String ) where
  attr DominantBaseline stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr FeConvolveMatrix_ DominantBaseline (NonEmpty.NonEmpty Event.Event  String ) where
  attr DominantBaseline bothValues = unsafeAttribute $ Both (pure 
    { key: "dominant-baseline", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr FeConvolveMatrix_ DominantBaseline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr DominantBaseline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "dominant-baseline", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr FeConvolveMatrix_ DominantBaseline  String  where
  attr DominantBaseline value = unsafeAttribute $ This $ pure $
    { key: "dominant-baseline", value: prop' value }
instance Attr FeConvolveMatrix_ DominantBaseline (Event.Event  String ) where
  attr DominantBaseline eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr FeConvolveMatrix_ DominantBaseline (ST.ST Global.Global  String ) where
  attr DominantBaseline stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr FeDiffuseLighting_ DominantBaseline (NonEmpty.NonEmpty Event.Event  String ) where
  attr DominantBaseline bothValues = unsafeAttribute $ Both (pure 
    { key: "dominant-baseline", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr FeDiffuseLighting_ DominantBaseline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr DominantBaseline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "dominant-baseline", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr FeDiffuseLighting_ DominantBaseline  String  where
  attr DominantBaseline value = unsafeAttribute $ This $ pure $
    { key: "dominant-baseline", value: prop' value }
instance Attr FeDiffuseLighting_ DominantBaseline (Event.Event  String ) where
  attr DominantBaseline eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr FeDiffuseLighting_ DominantBaseline (ST.ST Global.Global  String ) where
  attr DominantBaseline stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr FeDisplacementMap_ DominantBaseline (NonEmpty.NonEmpty Event.Event  String ) where
  attr DominantBaseline bothValues = unsafeAttribute $ Both (pure 
    { key: "dominant-baseline", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr FeDisplacementMap_ DominantBaseline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr DominantBaseline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "dominant-baseline", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr FeDisplacementMap_ DominantBaseline  String  where
  attr DominantBaseline value = unsafeAttribute $ This $ pure $
    { key: "dominant-baseline", value: prop' value }
instance Attr FeDisplacementMap_ DominantBaseline (Event.Event  String ) where
  attr DominantBaseline eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr FeDisplacementMap_ DominantBaseline (ST.ST Global.Global  String ) where
  attr DominantBaseline stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr FeFlood_ DominantBaseline (NonEmpty.NonEmpty Event.Event  String ) where
  attr DominantBaseline bothValues = unsafeAttribute $ Both (pure 
    { key: "dominant-baseline", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr FeFlood_ DominantBaseline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr DominantBaseline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "dominant-baseline", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr FeFlood_ DominantBaseline  String  where
  attr DominantBaseline value = unsafeAttribute $ This $ pure $
    { key: "dominant-baseline", value: prop' value }
instance Attr FeFlood_ DominantBaseline (Event.Event  String ) where
  attr DominantBaseline eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr FeFlood_ DominantBaseline (ST.ST Global.Global  String ) where
  attr DominantBaseline stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr FeGaussianBlur_ DominantBaseline (NonEmpty.NonEmpty Event.Event  String ) where
  attr DominantBaseline bothValues = unsafeAttribute $ Both (pure 
    { key: "dominant-baseline", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr FeGaussianBlur_ DominantBaseline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr DominantBaseline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "dominant-baseline", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr FeGaussianBlur_ DominantBaseline  String  where
  attr DominantBaseline value = unsafeAttribute $ This $ pure $
    { key: "dominant-baseline", value: prop' value }
instance Attr FeGaussianBlur_ DominantBaseline (Event.Event  String ) where
  attr DominantBaseline eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr FeGaussianBlur_ DominantBaseline (ST.ST Global.Global  String ) where
  attr DominantBaseline stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr FeImage_ DominantBaseline (NonEmpty.NonEmpty Event.Event  String ) where
  attr DominantBaseline bothValues = unsafeAttribute $ Both (pure 
    { key: "dominant-baseline", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr FeImage_ DominantBaseline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr DominantBaseline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "dominant-baseline", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr FeImage_ DominantBaseline  String  where
  attr DominantBaseline value = unsafeAttribute $ This $ pure $
    { key: "dominant-baseline", value: prop' value }
instance Attr FeImage_ DominantBaseline (Event.Event  String ) where
  attr DominantBaseline eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr FeImage_ DominantBaseline (ST.ST Global.Global  String ) where
  attr DominantBaseline stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr FeMerge_ DominantBaseline (NonEmpty.NonEmpty Event.Event  String ) where
  attr DominantBaseline bothValues = unsafeAttribute $ Both (pure 
    { key: "dominant-baseline", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr FeMerge_ DominantBaseline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr DominantBaseline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "dominant-baseline", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr FeMerge_ DominantBaseline  String  where
  attr DominantBaseline value = unsafeAttribute $ This $ pure $
    { key: "dominant-baseline", value: prop' value }
instance Attr FeMerge_ DominantBaseline (Event.Event  String ) where
  attr DominantBaseline eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr FeMerge_ DominantBaseline (ST.ST Global.Global  String ) where
  attr DominantBaseline stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr FeMorphology_ DominantBaseline (NonEmpty.NonEmpty Event.Event  String ) where
  attr DominantBaseline bothValues = unsafeAttribute $ Both (pure 
    { key: "dominant-baseline", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr FeMorphology_ DominantBaseline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr DominantBaseline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "dominant-baseline", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr FeMorphology_ DominantBaseline  String  where
  attr DominantBaseline value = unsafeAttribute $ This $ pure $
    { key: "dominant-baseline", value: prop' value }
instance Attr FeMorphology_ DominantBaseline (Event.Event  String ) where
  attr DominantBaseline eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr FeMorphology_ DominantBaseline (ST.ST Global.Global  String ) where
  attr DominantBaseline stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr FeOffset_ DominantBaseline (NonEmpty.NonEmpty Event.Event  String ) where
  attr DominantBaseline bothValues = unsafeAttribute $ Both (pure 
    { key: "dominant-baseline", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr FeOffset_ DominantBaseline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr DominantBaseline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "dominant-baseline", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr FeOffset_ DominantBaseline  String  where
  attr DominantBaseline value = unsafeAttribute $ This $ pure $
    { key: "dominant-baseline", value: prop' value }
instance Attr FeOffset_ DominantBaseline (Event.Event  String ) where
  attr DominantBaseline eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr FeOffset_ DominantBaseline (ST.ST Global.Global  String ) where
  attr DominantBaseline stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr FeSpecularLighting_ DominantBaseline (NonEmpty.NonEmpty Event.Event  String ) where
  attr DominantBaseline bothValues = unsafeAttribute $ Both (pure 
    { key: "dominant-baseline", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr FeSpecularLighting_ DominantBaseline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr DominantBaseline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "dominant-baseline", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr FeSpecularLighting_ DominantBaseline  String  where
  attr DominantBaseline value = unsafeAttribute $ This $ pure $
    { key: "dominant-baseline", value: prop' value }
instance Attr FeSpecularLighting_ DominantBaseline (Event.Event  String ) where
  attr DominantBaseline eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr FeSpecularLighting_ DominantBaseline (ST.ST Global.Global  String ) where
  attr DominantBaseline stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr FeTile_ DominantBaseline (NonEmpty.NonEmpty Event.Event  String ) where
  attr DominantBaseline bothValues = unsafeAttribute $ Both (pure 
    { key: "dominant-baseline", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr FeTile_ DominantBaseline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr DominantBaseline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "dominant-baseline", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr FeTile_ DominantBaseline  String  where
  attr DominantBaseline value = unsafeAttribute $ This $ pure $
    { key: "dominant-baseline", value: prop' value }
instance Attr FeTile_ DominantBaseline (Event.Event  String ) where
  attr DominantBaseline eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr FeTile_ DominantBaseline (ST.ST Global.Global  String ) where
  attr DominantBaseline stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr FeTurbulence_ DominantBaseline (NonEmpty.NonEmpty Event.Event  String ) where
  attr DominantBaseline bothValues = unsafeAttribute $ Both (pure 
    { key: "dominant-baseline", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr FeTurbulence_ DominantBaseline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr DominantBaseline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "dominant-baseline", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr FeTurbulence_ DominantBaseline  String  where
  attr DominantBaseline value = unsafeAttribute $ This $ pure $
    { key: "dominant-baseline", value: prop' value }
instance Attr FeTurbulence_ DominantBaseline (Event.Event  String ) where
  attr DominantBaseline eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr FeTurbulence_ DominantBaseline (ST.ST Global.Global  String ) where
  attr DominantBaseline stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr Filter_ DominantBaseline (NonEmpty.NonEmpty Event.Event  String ) where
  attr DominantBaseline bothValues = unsafeAttribute $ Both (pure 
    { key: "dominant-baseline", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr Filter_ DominantBaseline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr DominantBaseline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "dominant-baseline", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr Filter_ DominantBaseline  String  where
  attr DominantBaseline value = unsafeAttribute $ This $ pure $
    { key: "dominant-baseline", value: prop' value }
instance Attr Filter_ DominantBaseline (Event.Event  String ) where
  attr DominantBaseline eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr Filter_ DominantBaseline (ST.ST Global.Global  String ) where
  attr DominantBaseline stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr Image_ DominantBaseline (NonEmpty.NonEmpty Event.Event  String ) where
  attr DominantBaseline bothValues = unsafeAttribute $ Both (pure 
    { key: "dominant-baseline", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr Image_ DominantBaseline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr DominantBaseline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "dominant-baseline", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr Image_ DominantBaseline  String  where
  attr DominantBaseline value = unsafeAttribute $ This $ pure $
    { key: "dominant-baseline", value: prop' value }
instance Attr Image_ DominantBaseline (Event.Event  String ) where
  attr DominantBaseline eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr Image_ DominantBaseline (ST.ST Global.Global  String ) where
  attr DominantBaseline stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr Switch_ DominantBaseline (NonEmpty.NonEmpty Event.Event  String ) where
  attr DominantBaseline bothValues = unsafeAttribute $ Both (pure 
    { key: "dominant-baseline", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr Switch_ DominantBaseline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr DominantBaseline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "dominant-baseline", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr Switch_ DominantBaseline  String  where
  attr DominantBaseline value = unsafeAttribute $ This $ pure $
    { key: "dominant-baseline", value: prop' value }
instance Attr Switch_ DominantBaseline (Event.Event  String ) where
  attr DominantBaseline eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr Switch_ DominantBaseline (ST.ST Global.Global  String ) where
  attr DominantBaseline stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr Text_ DominantBaseline (NonEmpty.NonEmpty Event.Event  String ) where
  attr DominantBaseline bothValues = unsafeAttribute $ Both (pure 
    { key: "dominant-baseline", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr Text_ DominantBaseline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr DominantBaseline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "dominant-baseline", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr Text_ DominantBaseline  String  where
  attr DominantBaseline value = unsafeAttribute $ This $ pure $
    { key: "dominant-baseline", value: prop' value }
instance Attr Text_ DominantBaseline (Event.Event  String ) where
  attr DominantBaseline eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr Text_ DominantBaseline (ST.ST Global.Global  String ) where
  attr DominantBaseline stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr Tspan_ DominantBaseline (NonEmpty.NonEmpty Event.Event  String ) where
  attr DominantBaseline bothValues = unsafeAttribute $ Both (pure 
    { key: "dominant-baseline", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr Tspan_ DominantBaseline (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr DominantBaseline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "dominant-baseline", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "dominant-baseline", value: prop' value }
    )
instance Attr Tspan_ DominantBaseline  String  where
  attr DominantBaseline value = unsafeAttribute $ This $ pure $
    { key: "dominant-baseline", value: prop' value }
instance Attr Tspan_ DominantBaseline (Event.Event  String ) where
  attr DominantBaseline eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr Tspan_ DominantBaseline (ST.ST Global.Global  String ) where
  attr DominantBaseline stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "dominant-baseline", value: prop' value }

instance Attr everything DominantBaseline (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr DominantBaseline bothValues = unsafeAttribute $ Both (pure 
    { key: "dominant-baseline", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "dominant-baseline", value: unset' })
instance Attr everything DominantBaseline (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr DominantBaseline (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "dominant-baseline", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "dominant-baseline", value: unset' })
instance Attr everything DominantBaseline  Unit  where
  attr DominantBaseline _ = unsafeAttribute $ This $ pure $
    { key: "dominant-baseline", value: unset' }
instance Attr everything DominantBaseline (Event.Event  Unit ) where
  attr DominantBaseline eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "dominant-baseline", value: unset' }

instance Attr everything DominantBaseline (ST.ST Global.Global  Unit ) where
  attr DominantBaseline stValue = unsafeAttribute $ This $ stValue
    <#> \_ -> { key: "dominant-baseline", value: unset' }
