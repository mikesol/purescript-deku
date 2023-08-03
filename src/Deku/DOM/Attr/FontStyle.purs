module Deku.DOM.Attr.FontStyle where

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

data FontStyle = FontStyle

instance Attr FeBlend_ FontStyle (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStyle bothValues = unsafeAttribute $ Both (pure 
    { key: "font-style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr FeBlend_ FontStyle (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontStyle (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr FeBlend_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute $ This $ pure $
    { key: "font-style", value: prop' value }
instance Attr FeBlend_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr FeBlend_ FontStyle (ST.ST Global.Global  String ) where
  attr FontStyle stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr FeColorMatrix_ FontStyle (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStyle bothValues = unsafeAttribute $ Both (pure 
    { key: "font-style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr FeColorMatrix_ FontStyle (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontStyle (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr FeColorMatrix_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute $ This $ pure $
    { key: "font-style", value: prop' value }
instance Attr FeColorMatrix_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr FeColorMatrix_ FontStyle (ST.ST Global.Global  String ) where
  attr FontStyle stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr FeComponentTransfer_ FontStyle (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStyle bothValues = unsafeAttribute $ Both (pure 
    { key: "font-style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr FeComponentTransfer_ FontStyle (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontStyle (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr FeComponentTransfer_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute $ This $ pure $
    { key: "font-style", value: prop' value }
instance Attr FeComponentTransfer_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr FeComponentTransfer_ FontStyle (ST.ST Global.Global  String ) where
  attr FontStyle stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr FeComposite_ FontStyle (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStyle bothValues = unsafeAttribute $ Both (pure 
    { key: "font-style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr FeComposite_ FontStyle (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontStyle (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr FeComposite_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute $ This $ pure $
    { key: "font-style", value: prop' value }
instance Attr FeComposite_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr FeComposite_ FontStyle (ST.ST Global.Global  String ) where
  attr FontStyle stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr FeConvolveMatrix_ FontStyle (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStyle bothValues = unsafeAttribute $ Both (pure 
    { key: "font-style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr FeConvolveMatrix_ FontStyle (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontStyle (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr FeConvolveMatrix_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute $ This $ pure $
    { key: "font-style", value: prop' value }
instance Attr FeConvolveMatrix_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr FeConvolveMatrix_ FontStyle (ST.ST Global.Global  String ) where
  attr FontStyle stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr FeDiffuseLighting_ FontStyle (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStyle bothValues = unsafeAttribute $ Both (pure 
    { key: "font-style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr FeDiffuseLighting_ FontStyle (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontStyle (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr FeDiffuseLighting_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute $ This $ pure $
    { key: "font-style", value: prop' value }
instance Attr FeDiffuseLighting_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr FeDiffuseLighting_ FontStyle (ST.ST Global.Global  String ) where
  attr FontStyle stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr FeDisplacementMap_ FontStyle (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStyle bothValues = unsafeAttribute $ Both (pure 
    { key: "font-style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr FeDisplacementMap_ FontStyle (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontStyle (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr FeDisplacementMap_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute $ This $ pure $
    { key: "font-style", value: prop' value }
instance Attr FeDisplacementMap_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr FeDisplacementMap_ FontStyle (ST.ST Global.Global  String ) where
  attr FontStyle stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr FeFlood_ FontStyle (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStyle bothValues = unsafeAttribute $ Both (pure 
    { key: "font-style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr FeFlood_ FontStyle (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontStyle (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr FeFlood_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute $ This $ pure $
    { key: "font-style", value: prop' value }
instance Attr FeFlood_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr FeFlood_ FontStyle (ST.ST Global.Global  String ) where
  attr FontStyle stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr FeGaussianBlur_ FontStyle (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStyle bothValues = unsafeAttribute $ Both (pure 
    { key: "font-style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr FeGaussianBlur_ FontStyle (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontStyle (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr FeGaussianBlur_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute $ This $ pure $
    { key: "font-style", value: prop' value }
instance Attr FeGaussianBlur_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr FeGaussianBlur_ FontStyle (ST.ST Global.Global  String ) where
  attr FontStyle stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr FeImage_ FontStyle (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStyle bothValues = unsafeAttribute $ Both (pure 
    { key: "font-style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr FeImage_ FontStyle (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontStyle (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr FeImage_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute $ This $ pure $
    { key: "font-style", value: prop' value }
instance Attr FeImage_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr FeImage_ FontStyle (ST.ST Global.Global  String ) where
  attr FontStyle stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr FeMerge_ FontStyle (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStyle bothValues = unsafeAttribute $ Both (pure 
    { key: "font-style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr FeMerge_ FontStyle (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontStyle (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr FeMerge_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute $ This $ pure $
    { key: "font-style", value: prop' value }
instance Attr FeMerge_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr FeMerge_ FontStyle (ST.ST Global.Global  String ) where
  attr FontStyle stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr FeMorphology_ FontStyle (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStyle bothValues = unsafeAttribute $ Both (pure 
    { key: "font-style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr FeMorphology_ FontStyle (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontStyle (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr FeMorphology_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute $ This $ pure $
    { key: "font-style", value: prop' value }
instance Attr FeMorphology_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr FeMorphology_ FontStyle (ST.ST Global.Global  String ) where
  attr FontStyle stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr FeOffset_ FontStyle (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStyle bothValues = unsafeAttribute $ Both (pure 
    { key: "font-style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr FeOffset_ FontStyle (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontStyle (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr FeOffset_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute $ This $ pure $
    { key: "font-style", value: prop' value }
instance Attr FeOffset_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr FeOffset_ FontStyle (ST.ST Global.Global  String ) where
  attr FontStyle stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr FeSpecularLighting_ FontStyle (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStyle bothValues = unsafeAttribute $ Both (pure 
    { key: "font-style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr FeSpecularLighting_ FontStyle (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontStyle (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr FeSpecularLighting_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute $ This $ pure $
    { key: "font-style", value: prop' value }
instance Attr FeSpecularLighting_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr FeSpecularLighting_ FontStyle (ST.ST Global.Global  String ) where
  attr FontStyle stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr FeTile_ FontStyle (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStyle bothValues = unsafeAttribute $ Both (pure 
    { key: "font-style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr FeTile_ FontStyle (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontStyle (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr FeTile_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute $ This $ pure $
    { key: "font-style", value: prop' value }
instance Attr FeTile_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr FeTile_ FontStyle (ST.ST Global.Global  String ) where
  attr FontStyle stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr FeTurbulence_ FontStyle (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStyle bothValues = unsafeAttribute $ Both (pure 
    { key: "font-style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr FeTurbulence_ FontStyle (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontStyle (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr FeTurbulence_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute $ This $ pure $
    { key: "font-style", value: prop' value }
instance Attr FeTurbulence_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr FeTurbulence_ FontStyle (ST.ST Global.Global  String ) where
  attr FontStyle stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr Filter_ FontStyle (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStyle bothValues = unsafeAttribute $ Both (pure 
    { key: "font-style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr Filter_ FontStyle (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontStyle (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr Filter_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute $ This $ pure $
    { key: "font-style", value: prop' value }
instance Attr Filter_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr Filter_ FontStyle (ST.ST Global.Global  String ) where
  attr FontStyle stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr Image_ FontStyle (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStyle bothValues = unsafeAttribute $ Both (pure 
    { key: "font-style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr Image_ FontStyle (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontStyle (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr Image_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute $ This $ pure $
    { key: "font-style", value: prop' value }
instance Attr Image_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr Image_ FontStyle (ST.ST Global.Global  String ) where
  attr FontStyle stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr Switch_ FontStyle (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStyle bothValues = unsafeAttribute $ Both (pure 
    { key: "font-style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr Switch_ FontStyle (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontStyle (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr Switch_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute $ This $ pure $
    { key: "font-style", value: prop' value }
instance Attr Switch_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr Switch_ FontStyle (ST.ST Global.Global  String ) where
  attr FontStyle stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr Text_ FontStyle (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStyle bothValues = unsafeAttribute $ Both (pure 
    { key: "font-style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr Text_ FontStyle (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontStyle (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr Text_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute $ This $ pure $
    { key: "font-style", value: prop' value }
instance Attr Text_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr Text_ FontStyle (ST.ST Global.Global  String ) where
  attr FontStyle stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr Tspan_ FontStyle (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontStyle bothValues = unsafeAttribute $ Both (pure 
    { key: "font-style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr Tspan_ FontStyle (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontStyle (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "font-style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-style", value: prop' value })
instance Attr Tspan_ FontStyle  String  where
  attr FontStyle value = unsafeAttribute $ This $ pure $
    { key: "font-style", value: prop' value }
instance Attr Tspan_ FontStyle (Event.Event  String ) where
  attr FontStyle eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr Tspan_ FontStyle (ST.ST Global.Global  String ) where
  attr FontStyle stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "font-style", value: prop' value }

instance Attr everything FontStyle (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr FontStyle bothValues = unsafeAttribute $ Both (pure 
    { key: "font-style", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "font-style", value: unset' })
instance Attr everything FontStyle (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr FontStyle (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "font-style", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "font-style", value: unset' })
instance Attr everything FontStyle  Unit  where
  attr FontStyle _ = unsafeAttribute $ This $ pure $
    { key: "font-style", value: unset' }
instance Attr everything FontStyle (Event.Event  Unit ) where
  attr FontStyle eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "font-style", value: unset' }

instance Attr everything FontStyle (ST.ST Global.Global  Unit ) where
  attr FontStyle stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "font-style", value: unset' }
