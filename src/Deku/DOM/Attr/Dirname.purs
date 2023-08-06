module Deku.DOM.Attr.Dirname where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Dirname = Dirname

instance Attr Input_ Dirname (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dirname bothValues = unsafeAttribute $ Both (pure 
    { key: "dirname", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dirname", value: prop' value })
instance Attr Input_ Dirname (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dirname (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dirname", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dirname", value: prop' value })
instance Attr Input_ Dirname  String  where
  attr Dirname value = unsafeAttribute $ This $ pure $
    { key: "dirname", value: prop' value }
instance Attr Input_ Dirname (Event.Event  String ) where
  attr Dirname eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dirname", value: prop' value }

instance Attr Input_ Dirname (ST.ST Global.Global  String ) where
  attr Dirname iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "dirname", value: prop' value }

instance Attr Textarea_ Dirname (NonEmpty.NonEmpty Event.Event  String ) where
  attr Dirname bothValues = unsafeAttribute $ Both (pure 
    { key: "dirname", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dirname", value: prop' value })
instance Attr Textarea_ Dirname (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Dirname (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dirname", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dirname", value: prop' value })
instance Attr Textarea_ Dirname  String  where
  attr Dirname value = unsafeAttribute $ This $ pure $
    { key: "dirname", value: prop' value }
instance Attr Textarea_ Dirname (Event.Event  String ) where
  attr Dirname eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dirname", value: prop' value }

instance Attr Textarea_ Dirname (ST.ST Global.Global  String ) where
  attr Dirname iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "dirname", value: prop' value }

instance Attr everything Dirname (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Dirname bothValues = unsafeAttribute $ Both (pure 
    { key: "dirname", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "dirname", value: unset' })
instance Attr everything Dirname (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Dirname (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "dirname", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "dirname", value: unset' })
instance Attr everything Dirname  Unit  where
  attr Dirname _ = unsafeAttribute $ This $ { key: "dirname", value: unset' }
instance Attr everything Dirname (Event.Event  Unit ) where
  attr Dirname eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "dirname", value: unset' }

instance Attr everything Dirname (ST.ST Global.Global  Unit ) where
  attr Dirname iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "dirname", value: unset' }
