module Deku.DOM.Attr.Kerning where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
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

instance Attr FeBlend_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ Left $  
    { key: "kerning", value: prop' value }
instance Attr FeBlend_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }


instance Attr FeColorMatrix_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ Left $  
    { key: "kerning", value: prop' value }
instance Attr FeColorMatrix_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }


instance Attr FeComponentTransfer_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ Left $  
    { key: "kerning", value: prop' value }
instance Attr FeComponentTransfer_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }


instance Attr FeComposite_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ Left $  
    { key: "kerning", value: prop' value }
instance Attr FeComposite_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }


instance Attr FeConvolveMatrix_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ Left $  
    { key: "kerning", value: prop' value }
instance Attr FeConvolveMatrix_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }


instance Attr FeDiffuseLighting_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ Left $  
    { key: "kerning", value: prop' value }
instance Attr FeDiffuseLighting_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }


instance Attr FeDisplacementMap_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ Left $  
    { key: "kerning", value: prop' value }
instance Attr FeDisplacementMap_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }


instance Attr FeFlood_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ Left $  
    { key: "kerning", value: prop' value }
instance Attr FeFlood_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }


instance Attr FeGaussianBlur_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ Left $  
    { key: "kerning", value: prop' value }
instance Attr FeGaussianBlur_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }


instance Attr FeImage_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ Left $  
    { key: "kerning", value: prop' value }
instance Attr FeImage_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }


instance Attr FeMerge_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ Left $  
    { key: "kerning", value: prop' value }
instance Attr FeMerge_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }


instance Attr FeMorphology_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ Left $  
    { key: "kerning", value: prop' value }
instance Attr FeMorphology_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }


instance Attr FeOffset_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ Left $  
    { key: "kerning", value: prop' value }
instance Attr FeOffset_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }


instance Attr FeSpecularLighting_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ Left $  
    { key: "kerning", value: prop' value }
instance Attr FeSpecularLighting_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }


instance Attr FeTile_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ Left $  
    { key: "kerning", value: prop' value }
instance Attr FeTile_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }


instance Attr FeTurbulence_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ Left $  
    { key: "kerning", value: prop' value }
instance Attr FeTurbulence_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }


instance Attr Filter_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ Left $  
    { key: "kerning", value: prop' value }
instance Attr Filter_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }


instance Attr Image_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ Left $  
    { key: "kerning", value: prop' value }
instance Attr Image_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }


instance Attr Switch_ Kerning  String  where
  attr Kerning value = unsafeAttribute $ Left $  
    { key: "kerning", value: prop' value }
instance Attr Switch_ Kerning (Event.Event  String ) where
  attr Kerning eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "kerning", value: prop' value }


instance Attr everything Kerning  Unit  where
  attr Kerning _ = unsafeAttribute $ Left $  { key: "kerning", value: unset' }
instance Attr everything Kerning (Event.Event  Unit ) where
  attr Kerning eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "kerning", value: unset' }
