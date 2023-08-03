module Deku.DOM.Attr.EnableBackground where

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

data EnableBackground = EnableBackground

instance Attr FeBlend_ EnableBackground (NonEmpty.NonEmpty Event.Event  String ) where
  attr EnableBackground bothValues = unsafeAttribute $ Both (pure 
    { key: "enable-background", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr FeBlend_ EnableBackground (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr EnableBackground (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "enable-background", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr FeBlend_ EnableBackground  String  where
  attr EnableBackground value = unsafeAttribute $ This $ pure $
    { key: "enable-background", value: prop' value }
instance Attr FeBlend_ EnableBackground (Event.Event  String ) where
  attr EnableBackground eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr FeBlend_ EnableBackground (ST.ST Global.Global  String ) where
  attr EnableBackground stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr FeColorMatrix_ EnableBackground (NonEmpty.NonEmpty Event.Event  String ) where
  attr EnableBackground bothValues = unsafeAttribute $ Both (pure 
    { key: "enable-background", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr FeColorMatrix_ EnableBackground (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr EnableBackground (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "enable-background", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr FeColorMatrix_ EnableBackground  String  where
  attr EnableBackground value = unsafeAttribute $ This $ pure $
    { key: "enable-background", value: prop' value }
instance Attr FeColorMatrix_ EnableBackground (Event.Event  String ) where
  attr EnableBackground eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr FeColorMatrix_ EnableBackground (ST.ST Global.Global  String ) where
  attr EnableBackground stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr FeComponentTransfer_ EnableBackground (NonEmpty.NonEmpty Event.Event  String ) where
  attr EnableBackground bothValues = unsafeAttribute $ Both (pure 
    { key: "enable-background", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr FeComponentTransfer_ EnableBackground (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr EnableBackground (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "enable-background", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr FeComponentTransfer_ EnableBackground  String  where
  attr EnableBackground value = unsafeAttribute $ This $ pure $
    { key: "enable-background", value: prop' value }
instance Attr FeComponentTransfer_ EnableBackground (Event.Event  String ) where
  attr EnableBackground eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr FeComponentTransfer_ EnableBackground (ST.ST Global.Global  String ) where
  attr EnableBackground stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr FeComposite_ EnableBackground (NonEmpty.NonEmpty Event.Event  String ) where
  attr EnableBackground bothValues = unsafeAttribute $ Both (pure 
    { key: "enable-background", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr FeComposite_ EnableBackground (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr EnableBackground (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "enable-background", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr FeComposite_ EnableBackground  String  where
  attr EnableBackground value = unsafeAttribute $ This $ pure $
    { key: "enable-background", value: prop' value }
instance Attr FeComposite_ EnableBackground (Event.Event  String ) where
  attr EnableBackground eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr FeComposite_ EnableBackground (ST.ST Global.Global  String ) where
  attr EnableBackground stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr FeConvolveMatrix_ EnableBackground (NonEmpty.NonEmpty Event.Event  String ) where
  attr EnableBackground bothValues = unsafeAttribute $ Both (pure 
    { key: "enable-background", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr FeConvolveMatrix_ EnableBackground (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr EnableBackground (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "enable-background", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr FeConvolveMatrix_ EnableBackground  String  where
  attr EnableBackground value = unsafeAttribute $ This $ pure $
    { key: "enable-background", value: prop' value }
instance Attr FeConvolveMatrix_ EnableBackground (Event.Event  String ) where
  attr EnableBackground eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr FeConvolveMatrix_ EnableBackground (ST.ST Global.Global  String ) where
  attr EnableBackground stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr FeDiffuseLighting_ EnableBackground (NonEmpty.NonEmpty Event.Event  String ) where
  attr EnableBackground bothValues = unsafeAttribute $ Both (pure 
    { key: "enable-background", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr FeDiffuseLighting_ EnableBackground (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr EnableBackground (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "enable-background", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr FeDiffuseLighting_ EnableBackground  String  where
  attr EnableBackground value = unsafeAttribute $ This $ pure $
    { key: "enable-background", value: prop' value }
instance Attr FeDiffuseLighting_ EnableBackground (Event.Event  String ) where
  attr EnableBackground eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr FeDiffuseLighting_ EnableBackground (ST.ST Global.Global  String ) where
  attr EnableBackground stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr FeDisplacementMap_ EnableBackground (NonEmpty.NonEmpty Event.Event  String ) where
  attr EnableBackground bothValues = unsafeAttribute $ Both (pure 
    { key: "enable-background", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr FeDisplacementMap_ EnableBackground (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr EnableBackground (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "enable-background", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr FeDisplacementMap_ EnableBackground  String  where
  attr EnableBackground value = unsafeAttribute $ This $ pure $
    { key: "enable-background", value: prop' value }
instance Attr FeDisplacementMap_ EnableBackground (Event.Event  String ) where
  attr EnableBackground eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr FeDisplacementMap_ EnableBackground (ST.ST Global.Global  String ) where
  attr EnableBackground stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr FeFlood_ EnableBackground (NonEmpty.NonEmpty Event.Event  String ) where
  attr EnableBackground bothValues = unsafeAttribute $ Both (pure 
    { key: "enable-background", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr FeFlood_ EnableBackground (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr EnableBackground (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "enable-background", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr FeFlood_ EnableBackground  String  where
  attr EnableBackground value = unsafeAttribute $ This $ pure $
    { key: "enable-background", value: prop' value }
instance Attr FeFlood_ EnableBackground (Event.Event  String ) where
  attr EnableBackground eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr FeFlood_ EnableBackground (ST.ST Global.Global  String ) where
  attr EnableBackground stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr FeGaussianBlur_ EnableBackground (NonEmpty.NonEmpty Event.Event  String ) where
  attr EnableBackground bothValues = unsafeAttribute $ Both (pure 
    { key: "enable-background", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr FeGaussianBlur_ EnableBackground (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr EnableBackground (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "enable-background", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr FeGaussianBlur_ EnableBackground  String  where
  attr EnableBackground value = unsafeAttribute $ This $ pure $
    { key: "enable-background", value: prop' value }
instance Attr FeGaussianBlur_ EnableBackground (Event.Event  String ) where
  attr EnableBackground eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr FeGaussianBlur_ EnableBackground (ST.ST Global.Global  String ) where
  attr EnableBackground stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr FeImage_ EnableBackground (NonEmpty.NonEmpty Event.Event  String ) where
  attr EnableBackground bothValues = unsafeAttribute $ Both (pure 
    { key: "enable-background", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr FeImage_ EnableBackground (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr EnableBackground (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "enable-background", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr FeImage_ EnableBackground  String  where
  attr EnableBackground value = unsafeAttribute $ This $ pure $
    { key: "enable-background", value: prop' value }
instance Attr FeImage_ EnableBackground (Event.Event  String ) where
  attr EnableBackground eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr FeImage_ EnableBackground (ST.ST Global.Global  String ) where
  attr EnableBackground stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr FeMerge_ EnableBackground (NonEmpty.NonEmpty Event.Event  String ) where
  attr EnableBackground bothValues = unsafeAttribute $ Both (pure 
    { key: "enable-background", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr FeMerge_ EnableBackground (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr EnableBackground (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "enable-background", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr FeMerge_ EnableBackground  String  where
  attr EnableBackground value = unsafeAttribute $ This $ pure $
    { key: "enable-background", value: prop' value }
instance Attr FeMerge_ EnableBackground (Event.Event  String ) where
  attr EnableBackground eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr FeMerge_ EnableBackground (ST.ST Global.Global  String ) where
  attr EnableBackground stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr FeMorphology_ EnableBackground (NonEmpty.NonEmpty Event.Event  String ) where
  attr EnableBackground bothValues = unsafeAttribute $ Both (pure 
    { key: "enable-background", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr FeMorphology_ EnableBackground (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr EnableBackground (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "enable-background", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr FeMorphology_ EnableBackground  String  where
  attr EnableBackground value = unsafeAttribute $ This $ pure $
    { key: "enable-background", value: prop' value }
instance Attr FeMorphology_ EnableBackground (Event.Event  String ) where
  attr EnableBackground eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr FeMorphology_ EnableBackground (ST.ST Global.Global  String ) where
  attr EnableBackground stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr FeOffset_ EnableBackground (NonEmpty.NonEmpty Event.Event  String ) where
  attr EnableBackground bothValues = unsafeAttribute $ Both (pure 
    { key: "enable-background", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr FeOffset_ EnableBackground (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr EnableBackground (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "enable-background", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr FeOffset_ EnableBackground  String  where
  attr EnableBackground value = unsafeAttribute $ This $ pure $
    { key: "enable-background", value: prop' value }
instance Attr FeOffset_ EnableBackground (Event.Event  String ) where
  attr EnableBackground eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr FeOffset_ EnableBackground (ST.ST Global.Global  String ) where
  attr EnableBackground stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr FeSpecularLighting_ EnableBackground (NonEmpty.NonEmpty Event.Event  String ) where
  attr EnableBackground bothValues = unsafeAttribute $ Both (pure 
    { key: "enable-background", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr FeSpecularLighting_ EnableBackground (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr EnableBackground (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "enable-background", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr FeSpecularLighting_ EnableBackground  String  where
  attr EnableBackground value = unsafeAttribute $ This $ pure $
    { key: "enable-background", value: prop' value }
instance Attr FeSpecularLighting_ EnableBackground (Event.Event  String ) where
  attr EnableBackground eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr FeSpecularLighting_ EnableBackground (ST.ST Global.Global  String ) where
  attr EnableBackground stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr FeTile_ EnableBackground (NonEmpty.NonEmpty Event.Event  String ) where
  attr EnableBackground bothValues = unsafeAttribute $ Both (pure 
    { key: "enable-background", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr FeTile_ EnableBackground (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr EnableBackground (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "enable-background", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr FeTile_ EnableBackground  String  where
  attr EnableBackground value = unsafeAttribute $ This $ pure $
    { key: "enable-background", value: prop' value }
instance Attr FeTile_ EnableBackground (Event.Event  String ) where
  attr EnableBackground eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr FeTile_ EnableBackground (ST.ST Global.Global  String ) where
  attr EnableBackground stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr FeTurbulence_ EnableBackground (NonEmpty.NonEmpty Event.Event  String ) where
  attr EnableBackground bothValues = unsafeAttribute $ Both (pure 
    { key: "enable-background", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr FeTurbulence_ EnableBackground (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr EnableBackground (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "enable-background", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr FeTurbulence_ EnableBackground  String  where
  attr EnableBackground value = unsafeAttribute $ This $ pure $
    { key: "enable-background", value: prop' value }
instance Attr FeTurbulence_ EnableBackground (Event.Event  String ) where
  attr EnableBackground eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr FeTurbulence_ EnableBackground (ST.ST Global.Global  String ) where
  attr EnableBackground stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr Filter_ EnableBackground (NonEmpty.NonEmpty Event.Event  String ) where
  attr EnableBackground bothValues = unsafeAttribute $ Both (pure 
    { key: "enable-background", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr Filter_ EnableBackground (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr EnableBackground (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "enable-background", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr Filter_ EnableBackground  String  where
  attr EnableBackground value = unsafeAttribute $ This $ pure $
    { key: "enable-background", value: prop' value }
instance Attr Filter_ EnableBackground (Event.Event  String ) where
  attr EnableBackground eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr Filter_ EnableBackground (ST.ST Global.Global  String ) where
  attr EnableBackground stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr Image_ EnableBackground (NonEmpty.NonEmpty Event.Event  String ) where
  attr EnableBackground bothValues = unsafeAttribute $ Both (pure 
    { key: "enable-background", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr Image_ EnableBackground (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr EnableBackground (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "enable-background", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr Image_ EnableBackground  String  where
  attr EnableBackground value = unsafeAttribute $ This $ pure $
    { key: "enable-background", value: prop' value }
instance Attr Image_ EnableBackground (Event.Event  String ) where
  attr EnableBackground eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr Image_ EnableBackground (ST.ST Global.Global  String ) where
  attr EnableBackground stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr Switch_ EnableBackground (NonEmpty.NonEmpty Event.Event  String ) where
  attr EnableBackground bothValues = unsafeAttribute $ Both (pure 
    { key: "enable-background", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr Switch_ EnableBackground (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr EnableBackground (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "enable-background", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "enable-background", value: prop' value }
    )
instance Attr Switch_ EnableBackground  String  where
  attr EnableBackground value = unsafeAttribute $ This $ pure $
    { key: "enable-background", value: prop' value }
instance Attr Switch_ EnableBackground (Event.Event  String ) where
  attr EnableBackground eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr Switch_ EnableBackground (ST.ST Global.Global  String ) where
  attr EnableBackground stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "enable-background", value: prop' value }

instance Attr everything EnableBackground (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr EnableBackground bothValues = unsafeAttribute $ Both (pure 
    { key: "enable-background", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "enable-background", value: unset' })
instance Attr everything EnableBackground (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr EnableBackground (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "enable-background", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "enable-background", value: unset' })
instance Attr everything EnableBackground  Unit  where
  attr EnableBackground _ = unsafeAttribute $ This $ pure $
    { key: "enable-background", value: unset' }
instance Attr everything EnableBackground (Event.Event  Unit ) where
  attr EnableBackground eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "enable-background", value: unset' }

instance Attr everything EnableBackground (ST.ST Global.Global  Unit ) where
  attr EnableBackground stValue = unsafeAttribute $ This $ stValue
    <#> \_ -> { key: "enable-background", value: unset' }
