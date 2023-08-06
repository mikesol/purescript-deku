module Deku.DOM.Attr.Enctype where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Form (Form_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Enctype = Enctype

instance Attr Form_ Enctype  String  where
  attr Enctype value = unsafeAttribute $ Left $  
    { key: "enctype", value: prop' value }
instance Attr Form_ Enctype (Event.Event  String ) where
  attr Enctype eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "enctype", value: prop' value }


instance Attr everything Enctype  Unit  where
  attr Enctype _ = unsafeAttribute $ Left $  { key: "enctype", value: unset' }
instance Attr everything Enctype (Event.Event  Unit ) where
  attr Enctype eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "enctype", value: unset' }
