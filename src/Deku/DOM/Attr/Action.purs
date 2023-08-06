module Deku.DOM.Attr.Action where

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

data Action = Action

instance Attr Form_ Action  String  where
  attr Action value = unsafeAttribute $ Left $  
    { key: "action", value: prop' value }
instance Attr Form_ Action (Event.Event  String ) where
  attr Action eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "action", value: prop' value }


instance Attr everything Action  Unit  where
  attr Action _ = unsafeAttribute $ Left $  { key: "action", value: unset' }
instance Attr everything Action (Event.Event  Unit ) where
  attr Action eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "action", value: unset' }
