/**
 * @file scholarships.routes.js
 * @description Express routes for scholarship operations.
 */

import { Router } from 'express';
import {
  getScholarships,
  getScholarshipByIdOrSlug,
  createScholarship,
  updateScholarship,
  deleteScholarship,
} from '../controllers/scholarships.controller.js';

const router = Router();

router.get('/', getScholarships);
router.get('/:idOrSlug', getScholarshipByIdOrSlug);
router.post('/', createScholarship);
router.patch('/:idOrSlug', updateScholarship);
router.delete('/:idOrSlug', deleteScholarship);

export default router;
