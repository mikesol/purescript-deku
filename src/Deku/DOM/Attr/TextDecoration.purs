module Deku.DOM.Attr.TextDecoration where

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

data TextDecoration = TextDecoration

instance Attr FeBlend_ TextDecoration (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextDecoration bothValues = unsafeAttribute $ Both (pure 
    { key: "text-decoration", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr FeBlend_ TextDecoration (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextDecoration (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "text-decoration", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr FeBlend_ TextDecoration  String  where
  attr TextDecoration value = unsafeAttribute $ This $ pure $
    { key: "text-decoration", value: prop' value }
instance Attr FeBlend_ TextDecoration (Event.Event  String ) where
  attr TextDecoration eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr FeBlend_ TextDecoration (ST.ST Global.Global  String ) where
  attr TextDecoration stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr FeColorMatrix_ TextDecoration (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextDecoration bothValues = unsafeAttribute $ Both (pure 
    { key: "text-decoration", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr FeColorMatrix_ TextDecoration (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextDecoration (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "text-decoration", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr FeColorMatrix_ TextDecoration  String  where
  attr TextDecoration value = unsafeAttribute $ This $ pure $
    { key: "text-decoration", value: prop' value }
instance Attr FeColorMatrix_ TextDecoration (Event.Event  String ) where
  attr TextDecoration eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr FeColorMatrix_ TextDecoration (ST.ST Global.Global  String ) where
  attr TextDecoration stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr FeComponentTransfer_ TextDecoration (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextDecoration bothValues = unsafeAttribute $ Both (pure 
    { key: "text-decoration", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr FeComponentTransfer_ TextDecoration (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextDecoration (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "text-decoration", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr FeComponentTransfer_ TextDecoration  String  where
  attr TextDecoration value = unsafeAttribute $ This $ pure $
    { key: "text-decoration", value: prop' value }
instance Attr FeComponentTransfer_ TextDecoration (Event.Event  String ) where
  attr TextDecoration eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr FeComponentTransfer_ TextDecoration (ST.ST Global.Global  String ) where
  attr TextDecoration stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr FeComposite_ TextDecoration (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextDecoration bothValues = unsafeAttribute $ Both (pure 
    { key: "text-decoration", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr FeComposite_ TextDecoration (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextDecoration (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "text-decoration", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr FeComposite_ TextDecoration  String  where
  attr TextDecoration value = unsafeAttribute $ This $ pure $
    { key: "text-decoration", value: prop' value }
instance Attr FeComposite_ TextDecoration (Event.Event  String ) where
  attr TextDecoration eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr FeComposite_ TextDecoration (ST.ST Global.Global  String ) where
  attr TextDecoration stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr FeConvolveMatrix_ TextDecoration (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextDecoration bothValues = unsafeAttribute $ Both (pure 
    { key: "text-decoration", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr FeConvolveMatrix_ TextDecoration (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextDecoration (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "text-decoration", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr FeConvolveMatrix_ TextDecoration  String  where
  attr TextDecoration value = unsafeAttribute $ This $ pure $
    { key: "text-decoration", value: prop' value }
instance Attr FeConvolveMatrix_ TextDecoration (Event.Event  String ) where
  attr TextDecoration eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr FeConvolveMatrix_ TextDecoration (ST.ST Global.Global  String ) where
  attr TextDecoration stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr FeDiffuseLighting_ TextDecoration (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextDecoration bothValues = unsafeAttribute $ Both (pure 
    { key: "text-decoration", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr FeDiffuseLighting_ TextDecoration (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextDecoration (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "text-decoration", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr FeDiffuseLighting_ TextDecoration  String  where
  attr TextDecoration value = unsafeAttribute $ This $ pure $
    { key: "text-decoration", value: prop' value }
instance Attr FeDiffuseLighting_ TextDecoration (Event.Event  String ) where
  attr TextDecoration eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr FeDiffuseLighting_ TextDecoration (ST.ST Global.Global  String ) where
  attr TextDecoration stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr FeDisplacementMap_ TextDecoration (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextDecoration bothValues = unsafeAttribute $ Both (pure 
    { key: "text-decoration", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr FeDisplacementMap_ TextDecoration (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextDecoration (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "text-decoration", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr FeDisplacementMap_ TextDecoration  String  where
  attr TextDecoration value = unsafeAttribute $ This $ pure $
    { key: "text-decoration", value: prop' value }
instance Attr FeDisplacementMap_ TextDecoration (Event.Event  String ) where
  attr TextDecoration eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr FeDisplacementMap_ TextDecoration (ST.ST Global.Global  String ) where
  attr TextDecoration stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr FeFlood_ TextDecoration (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextDecoration bothValues = unsafeAttribute $ Both (pure 
    { key: "text-decoration", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr FeFlood_ TextDecoration (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextDecoration (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "text-decoration", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr FeFlood_ TextDecoration  String  where
  attr TextDecoration value = unsafeAttribute $ This $ pure $
    { key: "text-decoration", value: prop' value }
instance Attr FeFlood_ TextDecoration (Event.Event  String ) where
  attr TextDecoration eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr FeFlood_ TextDecoration (ST.ST Global.Global  String ) where
  attr TextDecoration stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr FeGaussianBlur_ TextDecoration (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextDecoration bothValues = unsafeAttribute $ Both (pure 
    { key: "text-decoration", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr FeGaussianBlur_ TextDecoration (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextDecoration (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "text-decoration", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr FeGaussianBlur_ TextDecoration  String  where
  attr TextDecoration value = unsafeAttribute $ This $ pure $
    { key: "text-decoration", value: prop' value }
instance Attr FeGaussianBlur_ TextDecoration (Event.Event  String ) where
  attr TextDecoration eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr FeGaussianBlur_ TextDecoration (ST.ST Global.Global  String ) where
  attr TextDecoration stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr FeImage_ TextDecoration (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextDecoration bothValues = unsafeAttribute $ Both (pure 
    { key: "text-decoration", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr FeImage_ TextDecoration (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextDecoration (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "text-decoration", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr FeImage_ TextDecoration  String  where
  attr TextDecoration value = unsafeAttribute $ This $ pure $
    { key: "text-decoration", value: prop' value }
instance Attr FeImage_ TextDecoration (Event.Event  String ) where
  attr TextDecoration eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr FeImage_ TextDecoration (ST.ST Global.Global  String ) where
  attr TextDecoration stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr FeMerge_ TextDecoration (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextDecoration bothValues = unsafeAttribute $ Both (pure 
    { key: "text-decoration", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr FeMerge_ TextDecoration (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextDecoration (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "text-decoration", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr FeMerge_ TextDecoration  String  where
  attr TextDecoration value = unsafeAttribute $ This $ pure $
    { key: "text-decoration", value: prop' value }
instance Attr FeMerge_ TextDecoration (Event.Event  String ) where
  attr TextDecoration eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr FeMerge_ TextDecoration (ST.ST Global.Global  String ) where
  attr TextDecoration stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr FeMorphology_ TextDecoration (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextDecoration bothValues = unsafeAttribute $ Both (pure 
    { key: "text-decoration", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr FeMorphology_ TextDecoration (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextDecoration (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "text-decoration", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr FeMorphology_ TextDecoration  String  where
  attr TextDecoration value = unsafeAttribute $ This $ pure $
    { key: "text-decoration", value: prop' value }
instance Attr FeMorphology_ TextDecoration (Event.Event  String ) where
  attr TextDecoration eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr FeMorphology_ TextDecoration (ST.ST Global.Global  String ) where
  attr TextDecoration stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr FeOffset_ TextDecoration (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextDecoration bothValues = unsafeAttribute $ Both (pure 
    { key: "text-decoration", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr FeOffset_ TextDecoration (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextDecoration (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "text-decoration", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr FeOffset_ TextDecoration  String  where
  attr TextDecoration value = unsafeAttribute $ This $ pure $
    { key: "text-decoration", value: prop' value }
instance Attr FeOffset_ TextDecoration (Event.Event  String ) where
  attr TextDecoration eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr FeOffset_ TextDecoration (ST.ST Global.Global  String ) where
  attr TextDecoration stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr FeSpecularLighting_ TextDecoration (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextDecoration bothValues = unsafeAttribute $ Both (pure 
    { key: "text-decoration", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr FeSpecularLighting_ TextDecoration (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextDecoration (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "text-decoration", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr FeSpecularLighting_ TextDecoration  String  where
  attr TextDecoration value = unsafeAttribute $ This $ pure $
    { key: "text-decoration", value: prop' value }
instance Attr FeSpecularLighting_ TextDecoration (Event.Event  String ) where
  attr TextDecoration eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr FeSpecularLighting_ TextDecoration (ST.ST Global.Global  String ) where
  attr TextDecoration stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr FeTile_ TextDecoration (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextDecoration bothValues = unsafeAttribute $ Both (pure 
    { key: "text-decoration", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr FeTile_ TextDecoration (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextDecoration (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "text-decoration", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr FeTile_ TextDecoration  String  where
  attr TextDecoration value = unsafeAttribute $ This $ pure $
    { key: "text-decoration", value: prop' value }
instance Attr FeTile_ TextDecoration (Event.Event  String ) where
  attr TextDecoration eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr FeTile_ TextDecoration (ST.ST Global.Global  String ) where
  attr TextDecoration stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr FeTurbulence_ TextDecoration (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextDecoration bothValues = unsafeAttribute $ Both (pure 
    { key: "text-decoration", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr FeTurbulence_ TextDecoration (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextDecoration (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "text-decoration", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr FeTurbulence_ TextDecoration  String  where
  attr TextDecoration value = unsafeAttribute $ This $ pure $
    { key: "text-decoration", value: prop' value }
instance Attr FeTurbulence_ TextDecoration (Event.Event  String ) where
  attr TextDecoration eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr FeTurbulence_ TextDecoration (ST.ST Global.Global  String ) where
  attr TextDecoration stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr Filter_ TextDecoration (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextDecoration bothValues = unsafeAttribute $ Both (pure 
    { key: "text-decoration", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr Filter_ TextDecoration (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextDecoration (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "text-decoration", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr Filter_ TextDecoration  String  where
  attr TextDecoration value = unsafeAttribute $ This $ pure $
    { key: "text-decoration", value: prop' value }
instance Attr Filter_ TextDecoration (Event.Event  String ) where
  attr TextDecoration eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr Filter_ TextDecoration (ST.ST Global.Global  String ) where
  attr TextDecoration stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr Image_ TextDecoration (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextDecoration bothValues = unsafeAttribute $ Both (pure 
    { key: "text-decoration", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr Image_ TextDecoration (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextDecoration (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "text-decoration", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr Image_ TextDecoration  String  where
  attr TextDecoration value = unsafeAttribute $ This $ pure $
    { key: "text-decoration", value: prop' value }
instance Attr Image_ TextDecoration (Event.Event  String ) where
  attr TextDecoration eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr Image_ TextDecoration (ST.ST Global.Global  String ) where
  attr TextDecoration stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr Switch_ TextDecoration (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextDecoration bothValues = unsafeAttribute $ Both (pure 
    { key: "text-decoration", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr Switch_ TextDecoration (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextDecoration (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "text-decoration", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "text-decoration", value: prop' value }
    )
instance Attr Switch_ TextDecoration  String  where
  attr TextDecoration value = unsafeAttribute $ This $ pure $
    { key: "text-decoration", value: prop' value }
instance Attr Switch_ TextDecoration (Event.Event  String ) where
  attr TextDecoration eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr Switch_ TextDecoration (ST.ST Global.Global  String ) where
  attr TextDecoration stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "text-decoration", value: prop' value }

instance Attr everything TextDecoration (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr TextDecoration bothValues = unsafeAttribute $ Both (pure 
    { key: "text-decoration", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "text-decoration", value: unset' })
instance Attr everything TextDecoration (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr TextDecoration (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "text-decoration", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "text-decoration", value: unset' })
instance Attr everything TextDecoration  Unit  where
  attr TextDecoration _ = unsafeAttribute $ This $ pure $
    { key: "text-decoration", value: unset' }
instance Attr everything TextDecoration (Event.Event  Unit ) where
  attr TextDecoration eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "text-decoration", value: unset' }

instance Attr everything TextDecoration (ST.ST Global.Global  Unit ) where
  attr TextDecoration stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "text-decoration", value: unset' }
