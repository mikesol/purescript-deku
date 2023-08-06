module Deku.DOM.Attr.Rowspan where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Rowspan = Rowspan

instance Attr Td_ Rowspan  String  where
  attr Rowspan value = unsafeAttribute $ Left $  
    { key: "rowspan", value: prop' value }
instance Attr Td_ Rowspan (Event.Event  String ) where
  attr Rowspan eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "rowspan", value: prop' value }


instance Attr Th_ Rowspan  String  where
  attr Rowspan value = unsafeAttribute $ Left $  
    { key: "rowspan", value: prop' value }
instance Attr Th_ Rowspan (Event.Event  String ) where
  attr Rowspan eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "rowspan", value: prop' value }


instance Attr everything Rowspan  Unit  where
  attr Rowspan _ = unsafeAttribute $ Left $  { key: "rowspan", value: unset' }
instance Attr everything Rowspan (Event.Event  Unit ) where
  attr Rowspan eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "rowspan", value: unset' }
