module Deku.DOM.Attr.Importance where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Script (Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Importance = Importance

instance Attr Iframe_ Importance  String  where
  attr Importance value = unsafeAttribute $ Left $  
    { key: "importance", value: prop' value }
instance Attr Iframe_ Importance (Event.Event  String ) where
  attr Importance eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "importance", value: prop' value }


instance Attr Img_ Importance  String  where
  attr Importance value = unsafeAttribute $ Left $  
    { key: "importance", value: prop' value }
instance Attr Img_ Importance (Event.Event  String ) where
  attr Importance eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "importance", value: prop' value }


instance Attr Link_ Importance  String  where
  attr Importance value = unsafeAttribute $ Left $  
    { key: "importance", value: prop' value }
instance Attr Link_ Importance (Event.Event  String ) where
  attr Importance eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "importance", value: prop' value }


instance Attr Script_ Importance  String  where
  attr Importance value = unsafeAttribute $ Left $  
    { key: "importance", value: prop' value }
instance Attr Script_ Importance (Event.Event  String ) where
  attr Importance eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "importance", value: prop' value }


instance Attr everything Importance  Unit  where
  attr Importance _ = unsafeAttribute $ Left $  
    { key: "importance", value: unset' }
instance Attr everything Importance (Event.Event  Unit ) where
  attr Importance eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "importance", value: unset' }
