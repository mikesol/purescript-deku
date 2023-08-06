module Deku.DOM.Attr.Summary where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Table (Table_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Summary = Summary

instance Attr Table_ Summary (NonEmpty.NonEmpty Event.Event  String ) where
  attr Summary bothValues = unsafeAttribute $ Both (pure 
    { key: "summary", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "summary", value: prop' value })
instance Attr Table_ Summary (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Summary (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "summary", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "summary", value: prop' value })
instance Attr Table_ Summary  String  where
  attr Summary value = unsafeAttribute $ This $ pure $
    { key: "summary", value: prop' value }
instance Attr Table_ Summary (Event.Event  String ) where
  attr Summary eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "summary", value: prop' value }

instance Attr Table_ Summary (ST.ST Global.Global  String ) where
  attr Summary iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "summary", value: prop' value }

instance Attr everything Summary (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Summary bothValues = unsafeAttribute $ Both (pure 
    { key: "summary", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "summary", value: unset' })
instance Attr everything Summary (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Summary (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "summary", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "summary", value: unset' })
instance Attr everything Summary  Unit  where
  attr Summary _ = unsafeAttribute $ This $ { key: "summary", value: unset' }
instance Attr everything Summary (Event.Event  Unit ) where
  attr Summary eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "summary", value: unset' }

instance Attr everything Summary (ST.ST Global.Global  Unit ) where
  attr Summary iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "summary", value: unset' }
