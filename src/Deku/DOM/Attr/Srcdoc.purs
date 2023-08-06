module Deku.DOM.Attr.Srcdoc where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Srcdoc = Srcdoc

instance Attr Iframe_ Srcdoc  String  where
  attr Srcdoc value = unsafeAttribute $ Left $  
    { key: "srcdoc", value: prop' value }
instance Attr Iframe_ Srcdoc (Event.Event  String ) where
  attr Srcdoc eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "srcdoc", value: prop' value }


instance Attr everything Srcdoc  Unit  where
  attr Srcdoc _ = unsafeAttribute $ Left $  { key: "srcdoc", value: unset' }
instance Attr everything Srcdoc (Event.Event  Unit ) where
  attr Srcdoc eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "srcdoc", value: unset' }
