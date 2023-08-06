module Deku.DOM.Attr.Alt where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Applet (Applet_)
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Alt = Alt

instance Attr Applet_ Alt (NonEmpty.NonEmpty Event.Event  String ) where
  attr Alt bothValues = unsafeAttribute $ Both (pure 
    { key: "alt", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "alt", value: prop' value })
instance Attr Applet_ Alt (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Alt (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "alt", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "alt", value: prop' value })
instance Attr Applet_ Alt  String  where
  attr Alt value = unsafeAttribute $ This $ { key: "alt", value: prop' value }
instance Attr Applet_ Alt (Event.Event  String ) where
  attr Alt eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "alt", value: prop' value }

instance Attr Applet_ Alt (ST.ST Global.Global  String ) where
  attr Alt iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "alt", value: prop' value }

instance Attr Area_ Alt (NonEmpty.NonEmpty Event.Event  String ) where
  attr Alt bothValues = unsafeAttribute $ Both (pure 
    { key: "alt", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "alt", value: prop' value })
instance Attr Area_ Alt (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Alt (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "alt", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "alt", value: prop' value })
instance Attr Area_ Alt  String  where
  attr Alt value = unsafeAttribute $ This $ { key: "alt", value: prop' value }
instance Attr Area_ Alt (Event.Event  String ) where
  attr Alt eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "alt", value: prop' value }

instance Attr Area_ Alt (ST.ST Global.Global  String ) where
  attr Alt iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "alt", value: prop' value }

instance Attr Img_ Alt (NonEmpty.NonEmpty Event.Event  String ) where
  attr Alt bothValues = unsafeAttribute $ Both (pure 
    { key: "alt", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "alt", value: prop' value })
instance Attr Img_ Alt (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Alt (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "alt", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "alt", value: prop' value })
instance Attr Img_ Alt  String  where
  attr Alt value = unsafeAttribute $ This $ { key: "alt", value: prop' value }
instance Attr Img_ Alt (Event.Event  String ) where
  attr Alt eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "alt", value: prop' value }

instance Attr Img_ Alt (ST.ST Global.Global  String ) where
  attr Alt iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "alt", value: prop' value }

instance Attr Input_ Alt (NonEmpty.NonEmpty Event.Event  String ) where
  attr Alt bothValues = unsafeAttribute $ Both (pure 
    { key: "alt", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "alt", value: prop' value })
instance Attr Input_ Alt (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Alt (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "alt", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "alt", value: prop' value })
instance Attr Input_ Alt  String  where
  attr Alt value = unsafeAttribute $ This $ { key: "alt", value: prop' value }
instance Attr Input_ Alt (Event.Event  String ) where
  attr Alt eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "alt", value: prop' value }

instance Attr Input_ Alt (ST.ST Global.Global  String ) where
  attr Alt iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "alt", value: prop' value }

instance Attr everything Alt (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Alt bothValues = unsafeAttribute $ Both (pure  { key: "alt", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "alt", value: unset' })
instance Attr everything Alt (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Alt (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->   { key: "alt", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "alt", value: unset' })
instance Attr everything Alt  Unit  where
  attr Alt _ = unsafeAttribute $ This $ { key: "alt", value: unset' }
instance Attr everything Alt (Event.Event  Unit ) where
  attr Alt eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "alt", value: unset' }

instance Attr everything Alt (ST.ST Global.Global  Unit ) where
  attr Alt iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "alt", value: unset' }
