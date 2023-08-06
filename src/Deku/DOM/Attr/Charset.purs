module Deku.DOM.Attr.Charset where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Meta (Meta_)
import Deku.DOM.Elt.Script (Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Charset = Charset

instance Attr Meta_ Charset  String  where
  attr Charset value = unsafeAttribute $ Left $  
    { key: "charset", value: prop' value }
instance Attr Meta_ Charset (Event.Event  String ) where
  attr Charset eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "charset", value: prop' value }


instance Attr Script_ Charset  String  where
  attr Charset value = unsafeAttribute $ Left $  
    { key: "charset", value: prop' value }
instance Attr Script_ Charset (Event.Event  String ) where
  attr Charset eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "charset", value: prop' value }


instance Attr everything Charset  Unit  where
  attr Charset _ = unsafeAttribute $ Left $  { key: "charset", value: unset' }
instance Attr everything Charset (Event.Event  Unit ) where
  attr Charset eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "charset", value: unset' }
