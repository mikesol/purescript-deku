-- In its naïve form, Deku SSR adds tags and identifiers to every DOM element
-- and text. This is unnecessary for sites that have lots of static content.
-- This module provides a way to optimize the SSR output by removing the
-- unnecessary tags and identifiers. It also constructs an `isBoring` cache
-- that identifies which elements can be skipped entirely during hydration.

module Deku.SSR.Optimize where

import Prelude

import Data.Maybe (Maybe(..))
import Data.Set as Set
import Deku.Internal.Ancestry (DekuAncestry(..))

truncateLineageBy1 :: DekuAncestry -> Maybe DekuAncestry
truncateLineageBy1 (Element _ a) = Just a
truncateLineageBy1 (Fixed _ a) = Just a
truncateLineageBy1 (Dyn _ a) = Just a
truncateLineageBy1 (Portal _ a) = Just a
truncateLineageBy1 Root = Nothing

lacksDynamicChildren :: Set.Set DekuAncestry -> DekuAncestry -> Boolean
lacksDynamicChildren = not $ flip Set.member

-- todo: a lot of fixed elements will have plain ancestry but are
-- disqualified from this algo currently
-- it's possible to code around that but it requires a lot of attention to detail
-- some tests will currently pick up on that but there aren't enough
-- so if anyone tackles fixed in this function, make sure to write more tests
-- using `fixed` in corner-case-y ways
hasPlainAncestry
  :: Set.Set DekuAncestry -> Set.Set DekuAncestry -> DekuAncestry -> Boolean
hasPlainAncestry parDynamos = go
  where
  -- we always check if the parent has dynamic children
  -- if so, it will need to be used as an anchor, so we disqualify it
  ldc = lacksDynamicChildren parDynamos
  go dynamos an@(Element i a)
    -- succeeds if the left and right elements are static
    | not
        ( Set.member (Element (i - 1) a) dynamos || Set.member
            (Element (i + 1) a)
            dynamos
        ) = ldc an
    | otherwise = false
  go _ Root = ldc Root
  go _ _ = false