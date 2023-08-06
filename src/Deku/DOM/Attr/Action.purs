module Deku.DOM.Attr.Action where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Form (Form_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Action = Action

instance Attr Form_ Action (NonEmpty.NonEmpty Event.Event  String ) where
  attr Action bothValues = unsafeAttribute $ Both (pure 
    { key: "action", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "action", value: prop' value })
instance Attr Form_ Action (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Action (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "action", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "action", value: prop' value })
instance Attr Form_ Action  String  where
  attr Action value = unsafeAttribute $ This $ pure $
    { key: "action", value: prop' value }
instance Attr Form_ Action (Event.Event  String ) where
  attr Action eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "action", value: prop' value }

instance Attr Form_ Action (ST.ST Global.Global  String ) where
  attr Action iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "action", value: prop' value }

instance Attr everything Action (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Action bothValues = unsafeAttribute $ Both (pure 
    { key: "action", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "action", value: unset' })
instance Attr everything Action (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Action (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "action", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "action", value: unset' })
instance Attr everything Action  Unit  where
  attr Action _ = unsafeAttribute $ This $ { key: "action", value: unset' }
instance Attr everything Action (Event.Event  Unit ) where
  attr Action eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "action", value: unset' }

instance Attr everything Action (ST.ST Global.Global  Unit ) where
  attr Action iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "action", value: unset' }
