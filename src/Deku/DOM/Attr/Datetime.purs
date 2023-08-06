module Deku.DOM.Attr.Datetime where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Del (Del_)
import Deku.DOM.Elt.Ins (Ins_)
import Deku.DOM.Elt.Time (Time_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Datetime = Datetime

instance Attr Del_ Datetime  String  where
  attr Datetime value = unsafeAttribute $ Left $  
    { key: "datetime", value: prop' value }
instance Attr Del_ Datetime (Event.Event  String ) where
  attr Datetime eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "datetime", value: prop' value }


instance Attr Ins_ Datetime  String  where
  attr Datetime value = unsafeAttribute $ Left $  
    { key: "datetime", value: prop' value }
instance Attr Ins_ Datetime (Event.Event  String ) where
  attr Datetime eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "datetime", value: prop' value }


instance Attr Time_ Datetime  String  where
  attr Datetime value = unsafeAttribute $ Left $  
    { key: "datetime", value: prop' value }
instance Attr Time_ Datetime (Event.Event  String ) where
  attr Datetime eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "datetime", value: prop' value }


instance Attr everything Datetime  Unit  where
  attr Datetime _ = unsafeAttribute $ Left $  
    { key: "datetime", value: unset' }
instance Attr everything Datetime (Event.Event  Unit ) where
  attr Datetime eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "datetime", value: unset' }
