module Deku.DOM.Attr.Checked where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Checked = Checked

instance Attr Input_ Checked  String  where
  attr Checked value = unsafeAttribute $ Left $  
    { key: "checked", value: prop' value }
instance Attr Input_ Checked (Event.Event  String ) where
  attr Checked eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "checked", value: prop' value }


instance Attr everything Checked  Unit  where
  attr Checked _ = unsafeAttribute $ Left $  { key: "checked", value: unset' }
instance Attr everything Checked (Event.Event  Unit ) where
  attr Checked eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "checked", value: unset' }
