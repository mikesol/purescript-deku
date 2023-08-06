module Deku.DOM.Attr.Autofocus where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Select (Select_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Autofocus = Autofocus

instance Attr Button_ Autofocus  String  where
  attr Autofocus value = unsafeAttribute $ Left $  
    { key: "autofocus", value: prop' value }
instance Attr Button_ Autofocus (Event.Event  String ) where
  attr Autofocus eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "autofocus", value: prop' value }


instance Attr Input_ Autofocus  String  where
  attr Autofocus value = unsafeAttribute $ Left $  
    { key: "autofocus", value: prop' value }
instance Attr Input_ Autofocus (Event.Event  String ) where
  attr Autofocus eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "autofocus", value: prop' value }


instance Attr Select_ Autofocus  String  where
  attr Autofocus value = unsafeAttribute $ Left $  
    { key: "autofocus", value: prop' value }
instance Attr Select_ Autofocus (Event.Event  String ) where
  attr Autofocus eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "autofocus", value: prop' value }


instance Attr Textarea_ Autofocus  String  where
  attr Autofocus value = unsafeAttribute $ Left $  
    { key: "autofocus", value: prop' value }
instance Attr Textarea_ Autofocus (Event.Event  String ) where
  attr Autofocus eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "autofocus", value: prop' value }


instance Attr everything Autofocus  Unit  where
  attr Autofocus _ = unsafeAttribute $ Left $  
    { key: "autofocus", value: unset' }
instance Attr everything Autofocus (Event.Event  Unit ) where
  attr Autofocus eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "autofocus", value: unset' }
