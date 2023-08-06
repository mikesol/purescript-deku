module Deku.DOM.Attr.TextLength where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Text (Text_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data TextLength = TextLength

instance Attr Text_ TextLength  String  where
  attr TextLength value = unsafeAttribute $ Left $  
    { key: "textLength", value: prop' value }
instance Attr Text_ TextLength (Event.Event  String ) where
  attr TextLength eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "textLength", value: prop' value }


instance Attr TextPath_ TextLength  String  where
  attr TextLength value = unsafeAttribute $ Left $  
    { key: "textLength", value: prop' value }
instance Attr TextPath_ TextLength (Event.Event  String ) where
  attr TextLength eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "textLength", value: prop' value }


instance Attr Tspan_ TextLength  String  where
  attr TextLength value = unsafeAttribute $ Left $  
    { key: "textLength", value: prop' value }
instance Attr Tspan_ TextLength (Event.Event  String ) where
  attr TextLength eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "textLength", value: prop' value }


instance Attr everything TextLength  Unit  where
  attr TextLength _ = unsafeAttribute $ Left $  
    { key: "textLength", value: unset' }
instance Attr everything TextLength (Event.Event  Unit ) where
  attr TextLength eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "textLength", value: unset' }
