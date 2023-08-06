module Deku.DOM.Attr.LetterSpacing where

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

data LetterSpacing = LetterSpacing

instance Attr FeBlend_ LetterSpacing  String  where
  attr LetterSpacing value = unsafeAttribute $ Left $  
    { key: "letter-spacing", value: prop' value }
instance Attr FeBlend_ LetterSpacing (Event.Event  String ) where
  attr LetterSpacing eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "letter-spacing", value: prop' value }


instance Attr FeColorMatrix_ LetterSpacing  String  where
  attr LetterSpacing value = unsafeAttribute $ Left $  
    { key: "letter-spacing", value: prop' value }
instance Attr FeColorMatrix_ LetterSpacing (Event.Event  String ) where
  attr LetterSpacing eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "letter-spacing", value: prop' value }


instance Attr FeComponentTransfer_ LetterSpacing  String  where
  attr LetterSpacing value = unsafeAttribute $ Left $  
    { key: "letter-spacing", value: prop' value }
instance Attr FeComponentTransfer_ LetterSpacing (Event.Event  String ) where
  attr LetterSpacing eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "letter-spacing", value: prop' value }


instance Attr FeComposite_ LetterSpacing  String  where
  attr LetterSpacing value = unsafeAttribute $ Left $  
    { key: "letter-spacing", value: prop' value }
instance Attr FeComposite_ LetterSpacing (Event.Event  String ) where
  attr LetterSpacing eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "letter-spacing", value: prop' value }


instance Attr FeConvolveMatrix_ LetterSpacing  String  where
  attr LetterSpacing value = unsafeAttribute $ Left $  
    { key: "letter-spacing", value: prop' value }
instance Attr FeConvolveMatrix_ LetterSpacing (Event.Event  String ) where
  attr LetterSpacing eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "letter-spacing", value: prop' value }


instance Attr FeDiffuseLighting_ LetterSpacing  String  where
  attr LetterSpacing value = unsafeAttribute $ Left $  
    { key: "letter-spacing", value: prop' value }
instance Attr FeDiffuseLighting_ LetterSpacing (Event.Event  String ) where
  attr LetterSpacing eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "letter-spacing", value: prop' value }


instance Attr FeDisplacementMap_ LetterSpacing  String  where
  attr LetterSpacing value = unsafeAttribute $ Left $  
    { key: "letter-spacing", value: prop' value }
instance Attr FeDisplacementMap_ LetterSpacing (Event.Event  String ) where
  attr LetterSpacing eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "letter-spacing", value: prop' value }


instance Attr FeFlood_ LetterSpacing  String  where
  attr LetterSpacing value = unsafeAttribute $ Left $  
    { key: "letter-spacing", value: prop' value }
instance Attr FeFlood_ LetterSpacing (Event.Event  String ) where
  attr LetterSpacing eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "letter-spacing", value: prop' value }


instance Attr FeGaussianBlur_ LetterSpacing  String  where
  attr LetterSpacing value = unsafeAttribute $ Left $  
    { key: "letter-spacing", value: prop' value }
instance Attr FeGaussianBlur_ LetterSpacing (Event.Event  String ) where
  attr LetterSpacing eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "letter-spacing", value: prop' value }


instance Attr FeImage_ LetterSpacing  String  where
  attr LetterSpacing value = unsafeAttribute $ Left $  
    { key: "letter-spacing", value: prop' value }
instance Attr FeImage_ LetterSpacing (Event.Event  String ) where
  attr LetterSpacing eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "letter-spacing", value: prop' value }


instance Attr FeMerge_ LetterSpacing  String  where
  attr LetterSpacing value = unsafeAttribute $ Left $  
    { key: "letter-spacing", value: prop' value }
instance Attr FeMerge_ LetterSpacing (Event.Event  String ) where
  attr LetterSpacing eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "letter-spacing", value: prop' value }


instance Attr FeMorphology_ LetterSpacing  String  where
  attr LetterSpacing value = unsafeAttribute $ Left $  
    { key: "letter-spacing", value: prop' value }
instance Attr FeMorphology_ LetterSpacing (Event.Event  String ) where
  attr LetterSpacing eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "letter-spacing", value: prop' value }


instance Attr FeOffset_ LetterSpacing  String  where
  attr LetterSpacing value = unsafeAttribute $ Left $  
    { key: "letter-spacing", value: prop' value }
instance Attr FeOffset_ LetterSpacing (Event.Event  String ) where
  attr LetterSpacing eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "letter-spacing", value: prop' value }


instance Attr FeSpecularLighting_ LetterSpacing  String  where
  attr LetterSpacing value = unsafeAttribute $ Left $  
    { key: "letter-spacing", value: prop' value }
instance Attr FeSpecularLighting_ LetterSpacing (Event.Event  String ) where
  attr LetterSpacing eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "letter-spacing", value: prop' value }


instance Attr FeTile_ LetterSpacing  String  where
  attr LetterSpacing value = unsafeAttribute $ Left $  
    { key: "letter-spacing", value: prop' value }
instance Attr FeTile_ LetterSpacing (Event.Event  String ) where
  attr LetterSpacing eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "letter-spacing", value: prop' value }


instance Attr FeTurbulence_ LetterSpacing  String  where
  attr LetterSpacing value = unsafeAttribute $ Left $  
    { key: "letter-spacing", value: prop' value }
instance Attr FeTurbulence_ LetterSpacing (Event.Event  String ) where
  attr LetterSpacing eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "letter-spacing", value: prop' value }


instance Attr Filter_ LetterSpacing  String  where
  attr LetterSpacing value = unsafeAttribute $ Left $  
    { key: "letter-spacing", value: prop' value }
instance Attr Filter_ LetterSpacing (Event.Event  String ) where
  attr LetterSpacing eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "letter-spacing", value: prop' value }


instance Attr Image_ LetterSpacing  String  where
  attr LetterSpacing value = unsafeAttribute $ Left $  
    { key: "letter-spacing", value: prop' value }
instance Attr Image_ LetterSpacing (Event.Event  String ) where
  attr LetterSpacing eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "letter-spacing", value: prop' value }


instance Attr Switch_ LetterSpacing  String  where
  attr LetterSpacing value = unsafeAttribute $ Left $  
    { key: "letter-spacing", value: prop' value }
instance Attr Switch_ LetterSpacing (Event.Event  String ) where
  attr LetterSpacing eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "letter-spacing", value: prop' value }


instance Attr everything LetterSpacing  Unit  where
  attr LetterSpacing _ = unsafeAttribute $ Left $  
    { key: "letter-spacing", value: unset' }
instance Attr everything LetterSpacing (Event.Event  Unit ) where
  attr LetterSpacing eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "letter-spacing", value: unset' }
