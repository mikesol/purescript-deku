module Deku.DOM.Attr.Enterkeyhint where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Enterkeyhint = Enterkeyhint

instance Attr Textarea_ Enterkeyhint (NonEmpty.NonEmpty Event.Event  String ) where
  attr Enterkeyhint bothValues = unsafeAttribute $ Both (pure 
    { key: "enterkeyhint", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "enterkeyhint", value: prop' value })
instance Attr Textarea_ Enterkeyhint (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Enterkeyhint (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "enterkeyhint", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "enterkeyhint", value: prop' value })
instance Attr Textarea_ Enterkeyhint  String  where
  attr Enterkeyhint value = unsafeAttribute $ This $ pure $
    { key: "enterkeyhint", value: prop' value }
instance Attr Textarea_ Enterkeyhint (Event.Event  String ) where
  attr Enterkeyhint eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "enterkeyhint", value: prop' value }

instance Attr Textarea_ Enterkeyhint (ST.ST Global.Global  String ) where
  attr Enterkeyhint stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "enterkeyhint", value: prop' value }

instance Attr everything Enterkeyhint (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Enterkeyhint bothValues = unsafeAttribute $ Both (pure 
    { key: "enterkeyhint", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "enterkeyhint", value: unset' })
instance Attr everything Enterkeyhint (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Enterkeyhint (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "enterkeyhint", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "enterkeyhint", value: unset' })
instance Attr everything Enterkeyhint  Unit  where
  attr Enterkeyhint _ = unsafeAttribute $ This $ pure $
    { key: "enterkeyhint", value: unset' }
instance Attr everything Enterkeyhint (Event.Event  Unit ) where
  attr Enterkeyhint eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "enterkeyhint", value: unset' }

instance Attr everything Enterkeyhint (ST.ST Global.Global  Unit ) where
  attr Enterkeyhint stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "enterkeyhint", value: unset' }
