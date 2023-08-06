module Deku.DOM.Attr.Background where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Body (Body_)
import Deku.DOM.Elt.Table (Table_)
import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Background = Background

instance Attr Body_ Background  String  where
  attr Background value = unsafeAttribute $ Left $  
    { key: "background", value: prop' value }
instance Attr Body_ Background (Event.Event  String ) where
  attr Background eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "background", value: prop' value }


instance Attr Table_ Background  String  where
  attr Background value = unsafeAttribute $ Left $  
    { key: "background", value: prop' value }
instance Attr Table_ Background (Event.Event  String ) where
  attr Background eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "background", value: prop' value }


instance Attr Td_ Background  String  where
  attr Background value = unsafeAttribute $ Left $  
    { key: "background", value: prop' value }
instance Attr Td_ Background (Event.Event  String ) where
  attr Background eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "background", value: prop' value }


instance Attr Th_ Background  String  where
  attr Background value = unsafeAttribute $ Left $  
    { key: "background", value: prop' value }
instance Attr Th_ Background (Event.Event  String ) where
  attr Background eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "background", value: prop' value }


instance Attr everything Background  Unit  where
  attr Background _ = unsafeAttribute $ Left $  
    { key: "background", value: unset' }
instance Attr everything Background (Event.Event  Unit ) where
  attr Background eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "background", value: unset' }
