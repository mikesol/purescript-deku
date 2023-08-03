module Deku.DOM.Attr.Align where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Applet (Applet_)
import Deku.DOM.Elt.Caption (Caption_)
import Deku.DOM.Elt.Col (Col_)
import Deku.DOM.Elt.Colgroup (Colgroup_)
import Deku.DOM.Elt.Hr (Hr_)
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Table (Table_)
import Deku.DOM.Elt.Tbody (Tbody_)
import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Tfoot (Tfoot_)
import Deku.DOM.Elt.Th (Th_)
import Deku.DOM.Elt.Thead (Thead_)
import Deku.DOM.Elt.Tr (Tr_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Align = Align

instance Attr Applet_ Align (NonEmpty.NonEmpty Event.Event  String ) where
  attr Align bothValues = unsafeAttribute $ Both (pure 
    { key: "align", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "align", value: prop' value })
instance Attr Applet_ Align (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Align (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "align", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "align", value: prop' value })
instance Attr Applet_ Align  String  where
  attr Align value = unsafeAttribute $ This $ pure $
    { key: "align", value: prop' value }
instance Attr Applet_ Align (Event.Event  String ) where
  attr Align eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "align", value: prop' value }

instance Attr Applet_ Align (ST.ST Global.Global  String ) where
  attr Align stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "align", value: prop' value }

instance Attr Caption_ Align (NonEmpty.NonEmpty Event.Event  String ) where
  attr Align bothValues = unsafeAttribute $ Both (pure 
    { key: "align", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "align", value: prop' value })
instance Attr Caption_ Align (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Align (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "align", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "align", value: prop' value })
instance Attr Caption_ Align  String  where
  attr Align value = unsafeAttribute $ This $ pure $
    { key: "align", value: prop' value }
instance Attr Caption_ Align (Event.Event  String ) where
  attr Align eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "align", value: prop' value }

instance Attr Caption_ Align (ST.ST Global.Global  String ) where
  attr Align stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "align", value: prop' value }

instance Attr Col_ Align (NonEmpty.NonEmpty Event.Event  String ) where
  attr Align bothValues = unsafeAttribute $ Both (pure 
    { key: "align", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "align", value: prop' value })
instance Attr Col_ Align (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Align (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "align", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "align", value: prop' value })
instance Attr Col_ Align  String  where
  attr Align value = unsafeAttribute $ This $ pure $
    { key: "align", value: prop' value }
instance Attr Col_ Align (Event.Event  String ) where
  attr Align eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "align", value: prop' value }

instance Attr Col_ Align (ST.ST Global.Global  String ) where
  attr Align stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "align", value: prop' value }

instance Attr Colgroup_ Align (NonEmpty.NonEmpty Event.Event  String ) where
  attr Align bothValues = unsafeAttribute $ Both (pure 
    { key: "align", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "align", value: prop' value })
instance Attr Colgroup_ Align (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Align (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "align", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "align", value: prop' value })
instance Attr Colgroup_ Align  String  where
  attr Align value = unsafeAttribute $ This $ pure $
    { key: "align", value: prop' value }
instance Attr Colgroup_ Align (Event.Event  String ) where
  attr Align eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "align", value: prop' value }

instance Attr Colgroup_ Align (ST.ST Global.Global  String ) where
  attr Align stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "align", value: prop' value }

instance Attr Hr_ Align (NonEmpty.NonEmpty Event.Event  String ) where
  attr Align bothValues = unsafeAttribute $ Both (pure 
    { key: "align", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "align", value: prop' value })
instance Attr Hr_ Align (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Align (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "align", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "align", value: prop' value })
instance Attr Hr_ Align  String  where
  attr Align value = unsafeAttribute $ This $ pure $
    { key: "align", value: prop' value }
instance Attr Hr_ Align (Event.Event  String ) where
  attr Align eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "align", value: prop' value }

instance Attr Hr_ Align (ST.ST Global.Global  String ) where
  attr Align stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "align", value: prop' value }

instance Attr Iframe_ Align (NonEmpty.NonEmpty Event.Event  String ) where
  attr Align bothValues = unsafeAttribute $ Both (pure 
    { key: "align", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "align", value: prop' value })
instance Attr Iframe_ Align (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Align (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "align", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "align", value: prop' value })
instance Attr Iframe_ Align  String  where
  attr Align value = unsafeAttribute $ This $ pure $
    { key: "align", value: prop' value }
instance Attr Iframe_ Align (Event.Event  String ) where
  attr Align eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "align", value: prop' value }

instance Attr Iframe_ Align (ST.ST Global.Global  String ) where
  attr Align stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "align", value: prop' value }

instance Attr Img_ Align (NonEmpty.NonEmpty Event.Event  String ) where
  attr Align bothValues = unsafeAttribute $ Both (pure 
    { key: "align", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "align", value: prop' value })
instance Attr Img_ Align (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Align (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "align", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "align", value: prop' value })
instance Attr Img_ Align  String  where
  attr Align value = unsafeAttribute $ This $ pure $
    { key: "align", value: prop' value }
instance Attr Img_ Align (Event.Event  String ) where
  attr Align eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "align", value: prop' value }

instance Attr Img_ Align (ST.ST Global.Global  String ) where
  attr Align stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "align", value: prop' value }

instance Attr Table_ Align (NonEmpty.NonEmpty Event.Event  String ) where
  attr Align bothValues = unsafeAttribute $ Both (pure 
    { key: "align", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "align", value: prop' value })
instance Attr Table_ Align (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Align (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "align", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "align", value: prop' value })
instance Attr Table_ Align  String  where
  attr Align value = unsafeAttribute $ This $ pure $
    { key: "align", value: prop' value }
instance Attr Table_ Align (Event.Event  String ) where
  attr Align eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "align", value: prop' value }

instance Attr Table_ Align (ST.ST Global.Global  String ) where
  attr Align stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "align", value: prop' value }

instance Attr Tbody_ Align (NonEmpty.NonEmpty Event.Event  String ) where
  attr Align bothValues = unsafeAttribute $ Both (pure 
    { key: "align", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "align", value: prop' value })
instance Attr Tbody_ Align (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Align (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "align", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "align", value: prop' value })
instance Attr Tbody_ Align  String  where
  attr Align value = unsafeAttribute $ This $ pure $
    { key: "align", value: prop' value }
instance Attr Tbody_ Align (Event.Event  String ) where
  attr Align eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "align", value: prop' value }

instance Attr Tbody_ Align (ST.ST Global.Global  String ) where
  attr Align stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "align", value: prop' value }

instance Attr Td_ Align (NonEmpty.NonEmpty Event.Event  String ) where
  attr Align bothValues = unsafeAttribute $ Both (pure 
    { key: "align", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "align", value: prop' value })
instance Attr Td_ Align (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Align (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "align", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "align", value: prop' value })
instance Attr Td_ Align  String  where
  attr Align value = unsafeAttribute $ This $ pure $
    { key: "align", value: prop' value }
instance Attr Td_ Align (Event.Event  String ) where
  attr Align eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "align", value: prop' value }

instance Attr Td_ Align (ST.ST Global.Global  String ) where
  attr Align stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "align", value: prop' value }

instance Attr Tfoot_ Align (NonEmpty.NonEmpty Event.Event  String ) where
  attr Align bothValues = unsafeAttribute $ Both (pure 
    { key: "align", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "align", value: prop' value })
instance Attr Tfoot_ Align (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Align (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "align", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "align", value: prop' value })
instance Attr Tfoot_ Align  String  where
  attr Align value = unsafeAttribute $ This $ pure $
    { key: "align", value: prop' value }
instance Attr Tfoot_ Align (Event.Event  String ) where
  attr Align eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "align", value: prop' value }

instance Attr Tfoot_ Align (ST.ST Global.Global  String ) where
  attr Align stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "align", value: prop' value }

instance Attr Th_ Align (NonEmpty.NonEmpty Event.Event  String ) where
  attr Align bothValues = unsafeAttribute $ Both (pure 
    { key: "align", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "align", value: prop' value })
instance Attr Th_ Align (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Align (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "align", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "align", value: prop' value })
instance Attr Th_ Align  String  where
  attr Align value = unsafeAttribute $ This $ pure $
    { key: "align", value: prop' value }
instance Attr Th_ Align (Event.Event  String ) where
  attr Align eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "align", value: prop' value }

instance Attr Th_ Align (ST.ST Global.Global  String ) where
  attr Align stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "align", value: prop' value }

instance Attr Thead_ Align (NonEmpty.NonEmpty Event.Event  String ) where
  attr Align bothValues = unsafeAttribute $ Both (pure 
    { key: "align", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "align", value: prop' value })
instance Attr Thead_ Align (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Align (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "align", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "align", value: prop' value })
instance Attr Thead_ Align  String  where
  attr Align value = unsafeAttribute $ This $ pure $
    { key: "align", value: prop' value }
instance Attr Thead_ Align (Event.Event  String ) where
  attr Align eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "align", value: prop' value }

instance Attr Thead_ Align (ST.ST Global.Global  String ) where
  attr Align stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "align", value: prop' value }

instance Attr Tr_ Align (NonEmpty.NonEmpty Event.Event  String ) where
  attr Align bothValues = unsafeAttribute $ Both (pure 
    { key: "align", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "align", value: prop' value })
instance Attr Tr_ Align (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Align (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "align", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "align", value: prop' value })
instance Attr Tr_ Align  String  where
  attr Align value = unsafeAttribute $ This $ pure $
    { key: "align", value: prop' value }
instance Attr Tr_ Align (Event.Event  String ) where
  attr Align eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "align", value: prop' value }

instance Attr Tr_ Align (ST.ST Global.Global  String ) where
  attr Align stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "align", value: prop' value }

instance Attr everything Align (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Align bothValues = unsafeAttribute $ Both (pure  { key: "align", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "align", value: unset' })
instance Attr everything Align (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Align (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "align", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "align", value: unset' })
instance Attr everything Align  Unit  where
  attr Align _ = unsafeAttribute $ This $ pure $ { key: "align", value: unset' }
instance Attr everything Align (Event.Event  Unit ) where
  attr Align eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "align", value: unset' }

instance Attr everything Align (ST.ST Global.Global  Unit ) where
  attr Align stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "align", value: unset' }
